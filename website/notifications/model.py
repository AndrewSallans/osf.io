from modularodm import fields
from framework.mongo import StoredObject


class Subscription(StoredObject):
    _id = fields.StringField(primary=True) # pxyz_wiki_updated, uabc_comment_replies
    object_id = fields.StringField()     # pid, user._id
    event_name = fields.StringField()      # wiki_updated, comment_replies

    # Notification types
    email_transactional = fields.ForeignField('user', list=True, backref='email_transactional')
