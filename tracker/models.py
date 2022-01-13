from django.conf import settings
from django.db import models
from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField

# Create your models here.

# Model for Client Tracking
# Overview: https://docs.djangoproject.com/en/3.1/topics/db/models/ 
# Fields: https://docs.djangoproject.com/en/3.1/ref/models/fields/#model-field-types 


# function to get the usecase ID that's being requested
# IMPORT the function above from one of your Views app where the UserStory is being created.
def get_usecase_id():
    # TODO fill in the use case id
    return false
    

# author is for pointing to the User that created the DB entry
class Client(models.Model):
    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.DO_NOTHING)
    client = models.CharField(max_length=32, unique=True)
    desc = RichTextUploadingField(blank=False, max_length=512, default='please enter a description')
    notes = RichTextUploadingField(blank=True, null=True)
    link = models.URLField(max_length=1024)

    def __str__(self):
        return f"{self.id}: {self.client.upper()} by {self.author}"

    def serialize(self):
        return {
            "id": self.id,
            "client": self.client,
            "desc": self.desc,
            "link": self.link
        }

# Product Model
class Product(models.Model):
    
    class Status(models.TextChoices):
        CONCEPT = 'Concept'
        PREALPHA = 'Pre Alpha'
        Alpha = 'Alpha'
        BETA = 'Beta'
        REVIEW = 'Release Candidate'
        LIVE = 'Live'

    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.DO_NOTHING)
    product = models.CharField(max_length=32, unique=True)
    desc = RichTextUploadingField(blank=False, max_length=512)
    status = models.CharField(choices=Status.choices,blank=False, max_length=24, default='Concept')
    img = models.URLField(max_length=1024, blank=True)

    def __str__(self):
        return f"{self.id}: {self.product}"
    
    def serialize(self):
        return {
        "id": self.id,
        "product": self.product,
        "desc": self.desc,
        "img": self.img,
        "status": self.status
    }


class Component(models.Model):
    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.DO_NOTHING)
    component = models.CharField(max_length=32, unique=True)
    desc = models.CharField(blank=False, max_length=512)
    img = models.URLField(max_length=1024, blank=True)

    def __str__(self):
        return f"{self.id}: {self.component} by: {self.author}"


# Use Case Model
class UseCase(models.Model):
    
    class Status(models.TextChoices):
        NA = 'Not Supported'
        QUEUED = 'Queued'
        REVIEW = 'Review'
        LIVE = 'Live'
    
    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.DO_NOTHING)
    use_case = models.CharField(max_length=32, unique=True)
    desc = RichTextUploadingField(blank=False, max_length=512)
    doc = models.URLField(max_length=1024, blank=True)
    status = models.CharField(choices=Status.choices, max_length=24)
    
    def __str__(self):
        return f"{self.id}: {self.use_case} by: {self.author} status: {self.status}"

    def serialize(self):
        return {
        "id": self.id,
        "use_case": self.use_case,
        "desc": self.desc,
        "doc": self.doc,
        "status": self.status
    }


class UserStory(models.Model):
    
    class Operator(models.TextChoices):
        AND = 'AND'
        OR = 'OR'

    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.DO_NOTHING)
    usecase = models.ForeignKey('UseCase', blank=False, on_delete=models.CASCADE, default=models.SET(get_usecase_id))
    i_need_to = models.CharField(blank=False, max_length=256)
    then = models.CharField(blank=True, max_length=256)
    operator = models.CharField(blank=True, choices=Operator.choices, max_length=3)
    so_that = models.CharField(blank=False, max_length=128)

    def __str__(self):
        return f"{self.id}: {self.usecase} by:{self.author} "


# Look Up Tables for many-to-many relationships
class Client_Product(models.Model):

    class Status(models.TextChoices):
        LIVE = 'Live'
        TRIAL = 'In Trial'
        OPP = 'Opportunity'
        WARM = 'Warm Lead'
        IMP = 'Implementation'
        REVIEW = 'Opportunity Under Review'
        CLOSED = 'Did not Purchase'

    client = models.ForeignKey('Client', on_delete=models.CASCADE)
    product = models.ForeignKey('Product', on_delete=models.CASCADE)
    status = models.CharField(choices=Status.choices, max_length=24, default='OPP')


# Use cases can help map Products that share similar workflows and perhaps an opp for cross-app synergies
class Product_UseCase(models.Model):

    class Status(models.TextChoices):
        LIVE = 'Live'
        NA = 'Not Supported'
        QUEUED = 'Queued'
        REVIEW = 'Review'

    product = models.ForeignKey('Product', on_delete=models.CASCADE)
    usecase = models.ForeignKey('UseCase', on_delete=models.CASCADE)
    status = models.CharField('Status', choices=Status.choices, max_length=24, default='Queued')

    def __str__(self):
        return f"{self.id}: {self.product} < -- > Ability to {self.usecase}"

    
# Components are meant to be shared across multple products to reduce replication of efforts. Products can have multiple Components, and vice versa
class Product_Component(models.Model):
    product = models.ForeignKey('Product', on_delete=models.CASCADE)
    component = models.ForeignKey('Component', on_delete=models.CASCADE)
    


class Client_UseCase(models.Model):
    class Status(models.TextChoices):
        LIVE = 'Live'
        NA = 'Not Supported'
        QUEUED = 'Queued'
        REVIEW = 'Review'

    # there might not be a Product for a Use Case but a client may still have a need. This covers that gap.
    client = models.ForeignKey('Client', on_delete=models.CASCADE)
    usecase = models.ForeignKey('UseCase', on_delete=models.CASCADE)
    status = models.CharField('Status', choices=Status.choices, max_length=24, default='Review')

    def __str__(self):
        return f"{self.id}: {self.client} < -- > {self.usecase}"


