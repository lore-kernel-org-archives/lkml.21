Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.94
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795230963;
	b=pU1O65o7f4/1Tgv/Pp37ZHcLrMGNGKVyZJF2LUmgC8utWYgp+pndENwaZcK4akIf930t
	 hOlFnGRKznnIOEOlBaOUQOpzDlXqx6TQbAdGyMsxryYSwLb1P035XJQXAVphk80/ddDHF
	 ZRH07tBrD81Cln6yTrDml1KAKcs2G3GdmMeMlue97BH+AtWxQb/rgWZ0Hy8k+JjWNf8R0
	 zd5fY+yJmmwpxu3JAS+geNis6MoKpomJC3s1WWxe5suk2UPR9Ea7Q8Yb9tsXSQDsRuMsn
	 5dv+sXELJisdIy97WWeFQIru2jeC6c0wEjXAF3P2FgdnvP4FQlr9D0BOJBfPZxONYcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795230963;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=pe+9DJtEfTEwm+v12jCwcsqOq+LU8TUrv8c2Fe3uTUg=;
	b=3GAGf2n019X1HM/6XhqcR+Mg2BtRuI/gsQC7ANETrNGuFTe1SMtUeyDKQMOTtuG5kTfK
	 GYSi5RP4uEWnTGNNyR+5XXHasQQpIqfy3nKYilpcUCSLn3U1s8HZf9eyThInMHWVjvgCF
	 3QP6qeoui6nQm01gCz/euVPVLRKaHZhfGqv9e6vO7Xi9nuPIk7arDN8o2GtPiGLK8IVqp
	 kSlRvXM9cVylcmbkhT82lB/hX4+Zdz3Nu4pF6TbeG5ONEHOdyBH/kJppNaRghRFCkcEFc
	 F+ky7DPJixUtrQyFkvjosw3anRKHcy481vCtuCFsgnxsI8Elivkg/oT1mUNlyIM5d7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=F+tasD1K;
	arc=none smtp.remote-ip=91.218.175.94
Received: from mta0.migadu.com (out-94.mta0.migadu.com [91.218.175.94])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC00606A695
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDC00606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=F+tasD1K
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GOhAz0HegWhbw4AYpNHVbhsgOGOUC7L0dYvhO6Ceht0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795230953; v=1; x=1795835753;
 b=F+tasD1KmTqXYgHZJ0qjMFOuF5xKY23u28h8jLRGfhfIMxi6edg5kgp4BylshNHtlwGWduJD
 JXk2PogyjrrbtnRrqtYKbF1ywSdEYAyZbzSEPYUBM72aXjbaIF8bxqSkSq4UZB6GKBKg0+GB3Qb
 4FqUJTXzFHfyjb2Dfz8P5U60=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1b1de2d9703d52d3;
	Sat, 21 Nov 2026 03:15:53 +0000
X-Mizu-Trace-ID: 1b1de2d9703d52d3
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Corey Minyard <corey@minyard.net>
Cc: openipmi-developer@lists.sourceforge.net,
	Meta kernel team <kernel-team@meta.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ipmi:msghandler: Free queued requests of a destroyed user
Date: Fri, 20 Nov 2026 19:15:49 -0800
Message-ID: <20261121031549.3599823-1-shakeel.butt@linux.dev>
X-Mailer: git-send-email 2.53.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the Meta fleet we found hosts whose BMC had stopped answering IPMI
requests while a power management daemon kept polling it:

- the daemon runs "timeout 2 ipmitool raw 0x30 0x7e" every two seconds;
- every run leaves one request and one closed IPMI user behind;
- one host held over a million closed users after 25 days, using about
  33 GiB and growing by 1.3 GiB a day.

ipmitool opens /dev/ipmi0, sends a request and waits for the answer.
When timeout kills it, the file is closed and ipmi_destroy_user() runs.
A request that is still waiting on intf->xmit_msgs or intf->hp_xmit_msgs
stays there, and its receive message keeps a reference on the user.
With a BMC that does not answer, the lower layer is slow to fail each
request: about 15 seconds of retries for SSIF, and up to a minute for
KCS on kernels without the hosed BMC handling from
commit bc3a9d217755 ("ipmi:si: Gracefully handle if the BMC is non-functional").
Requests arrive faster than they leave, so the queue, the users and
their messages grow until the BMC answers again.

Nobody can receive these responses once the user is destroyed. Free the
user's requests that were not handed to the lower layer yet. Such a
request is then never sent to the BMC. This only matters for a program
that sends a request and closes the device without waiting for the
answer, and with a working BMC a request waits in these lists only
while another request is being handled.

The request the lower layer is working on (intf->curr_msg) is left
alone. IPMB and LAN commands do not point to their receive message, so
they are not touched here. Their receive messages are freed by the
sequence table loop just above, as before.

Tested in QEMU with a fake BMC that stops answering and four loops of
"timeout 2 ipmitool raw 0x30 0x7e", with KASAN and lockdep enabled:

- SSIF on linux-next: 465 closed users were held after 4 minutes,
  growing by about 116 a minute. With this patch, 5 are held (the four
  live callers and the request in flight), and the number stays flat.
- KCS on v6.16, which lacks the hosed BMC handling, with this change
  adapted: 476 held after 4 minutes without it, 5 with it.
- KCS on linux-next: at most 5 held instead of up to 28.
- With a working BMC, 1600 requests from 8 parallel ipmitool loops all
  succeed over KCS and SSIF, and nothing is left held afterwards.

QEMU needed small changes to behave like the failing BMC: ipmi-bmc-extern
makes up a timeout reply after 4 seconds, its KCS keeps IBF set while
the BMC has not answered, and smbus-ipmi returns the previous reply
instead of NAKing the read.

Fixes: 7ea0ed2b5be8 ("ipmi: Make the message handler easier to use for SMI interfaces")
Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
 drivers/char/ipmi/ipmi_msghandler.c | 41 +++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index 152dd6b5bb27..52e95e1949b9 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -1339,6 +1339,45 @@ int ipmi_get_smi_info(int if_num, struct ipmi_smi_info *data)
 }
 EXPORT_SYMBOL(ipmi_get_smi_info);
 
+static void move_user_xmit_msgs(struct list_head *from, struct list_head *to,
+				struct ipmi_user *user)
+{
+	struct ipmi_smi_msg *msg, *msg2;
+
+	list_for_each_entry_safe(msg, msg2, from, link) {
+		if (msg->recv_msg && msg->recv_msg->user == user)
+			list_move_tail(&msg->link, to);
+	}
+}
+
+/*
+ * Free the requests of a user that are still waiting to be handed to the
+ * lower layer.  Once the user is destroyed, nobody can receive their
+ * responses.  If the BMC is slow or does not answer, they could otherwise
+ * stay queued for a long time, each one keeping the user and its own
+ * messages allocated.  A request that was already handed to the lower
+ * layer (intf->curr_msg) is not on these lists and is left alone.
+ */
+static void remove_user_xmit_msgs(struct ipmi_smi *intf,
+				  struct ipmi_user *user)
+{
+	int run_to_completion = READ_ONCE(intf->run_to_completion);
+	struct ipmi_smi_msg *msg, *msg2;
+	unsigned long flags = 0;
+	LIST_HEAD(msgs);
+
+	ipmi_lock_xmit_msgs(intf, run_to_completion, &flags);
+	move_user_xmit_msgs(&intf->hp_xmit_msgs, &msgs, user);
+	move_user_xmit_msgs(&intf->xmit_msgs, &msgs, user);
+	ipmi_unlock_xmit_msgs(intf, run_to_completion, &flags);
+
+	list_for_each_entry_safe(msg, msg2, &msgs, link) {
+		list_del(&msg->link);
+		ipmi_free_recv_msg(msg->recv_msg);
+		ipmi_free_smi_msg(msg);
+	}
+}
+
 /* Must be called with intf->users_mutex held. */
 static void _ipmi_destroy_user(struct ipmi_user *user)
 {
@@ -1375,6 +1414,8 @@ static void _ipmi_destroy_user(struct ipmi_user *user)
 	}
 	mutex_unlock(&intf->seq_lock);
 
+	remove_user_xmit_msgs(intf, user);
+
 	/*
 	 * Remove the user from the command receiver's table.  First
 	 * we build a list of everything (not using the standard link,
-- 
2.53.1-Meta

