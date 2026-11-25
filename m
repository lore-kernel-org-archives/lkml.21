Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620158;
	b=RT8TfROC4p0X7P4BnQqbKBAfx2ojV1d0kXDU9TFRGF1oQ3JbFhTcvMDNeDx8d3iVDFml
	 a4lKMRVt0fECehDdmGpSRZ5j4gGLOlfF5K+kkL8EZ7S1RgNkMRh4alRlLTDZV34AQZpfP
	 XPB+t/acDXgL8EFTFWDRvbapgY1ndST1OxBsfzn4Nig49GnhU8LjVSgziTww9JcsgE4Ld
	 xmnJbIuVDJBNg/yBIepl721drv+l6vmu97JmXPNP1whGRiaRE5sdLyxR2IBStJ0Mi+ow5
	 zisTnfjuIr8ZP1sUaejPnJkVcXzM2A3aP72N48AmSXHTHVxZAbCkfagyWnrwplYY/IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bEF8M/s3yAdvW6UfQALPsy2Yfd220r/9bf/yWk6z0O8=;
	b=zB/jc6gRjhbCUU/tap6/XvrACtdwIPArnVjoJPW7Xg64QIB66LIUQNHegVXDwI6WkRCN
	 KG71f9fefPvo9Y9RQTM+rPyud8gopAoHCwz3JcgVmOtFllcwHzj/grsr7/C87qPJIvYLJ
	 PQoq8En/nocqs+PfPq+A6d0IT+E2P7HPd5aKsujhM5eyDA3dwgykzaut+OYfAgTtFKqCQ
	 HA28TWKk/EYziDI2ASaJrVsbOWVo0I+hdaef0ovoOOQiuzzKfA6MUkwfan8KB1iVZ9OZ2
	 8SBICAdOK/0DIsaPdGRvirbb199iQnRzxpYn0GMk0HnxtZQNLQ1bxe7IRNn1pby6YSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ShO+44dG;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1F9606A691
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B1F9606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ShO+44dG
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so2564337b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795620158; x=1796224958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEF8M/s3yAdvW6UfQALPsy2Yfd220r/9bf/yWk6z0O8=;
        b=ShO+44dG0IqJ9GlcQQUQyr5sqsbBZOqrweihS+Lubx454FRXo6ifAMN052TN+6RZkQ
         C/iT2Bkw3SkKdCJSOog+BFVNnWi1PWrKxx88XWByDjB1iZWloDF2DIBuLRWZyqaomLsQ
         gXyc15GKvu1cZuxd89Mqz8oi5C8JW39qsjH6LmuvQsQ4kXMF6Y9y6snP7UgbrY8ZIrQM
         Lx48RmPVjH1c6FORxuOe7zV+55jEL4a6WHAUP/QcY5aKjIEZClaHfp3pIaJz9W5ijhJj
         sGtancB+OMFFChas8fYlEz5E/UEqa1uqpQ+4aoCRHqgXLXRpvpfyPybA7lNbm0CrbsXe
         Fw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620158; x=1796224958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEF8M/s3yAdvW6UfQALPsy2Yfd220r/9bf/yWk6z0O8=;
        b=LZKQTjcPj0Kn8Z1uFUbXv7BzqObg+XwYiOhkj6wKUKFkrEMZiVC2XaW4OE2PiHeGv5
         2AE4AUsvZVxEpzXl5gpJyRjL8KJEvdINT2ASrOzqKYWixIEsFD6EyXxZ4Az/9tj6Qi6Y
         JAjcxV38hCcj4CpsbPqgseeEmp3EQAmhFNzZWWxBACrODOw8826plnbnXNu/iQ9B0nkw
         aXuSMzsLQKe770XjE3YhG7f4XVdXL+xufrF5kmBpnIm7H70adsGDPr8LzsCDIXNIcvtt
         1qDPFmI7GJbbTIYhM4rwLDxQmEsJUaiAwccOA4ceutrWrMhCXItZgV/LKnxInd2DDDQX
         yokw==
X-Forwarded-Encrypted: i=1; AL+hErHou7CZJmU6ZNyjSxlba8qDRlM7wp3kYiTP1JVJ2uctB4ykXDOHH3Zd9fo94GDtWOb4+wpFVez5w2O5Yzk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+W4Wkgww0kpg9B3h0OimhUQ9NvrmQlzSrm6AsTI+nf+rA8tTZT
	A0sn5efx82q2btdfV5gWey8Gsiiy+jkufMazMSneSD94rbWq0QZITkH1MXtcsOd5GyE=
X-Gm-Gg: AZFdTZeAKddEa10C4OV+0PDM1I/6Fkpf2x5q/RbspCtL1IeYP0nV+xIjIs5iSf7YNng
	oRB+NOzjfwD3p60vGjwDImbVxgE9f/AgFCVG0sE9ADDPa+LWlW3gk43ITJ3JJ6Rf7gIYAi6bvlZ
	gM/oeu3UIwZtqLqI6s1tOtoNQ/fQKcSeqhOlml5A6kYguAAZcpauuhVdQpXAD8tNn/u/L5bDurE
	7gD9vdyI8xlJqHvQBb6fxAU/I3xbLJLeiEalHOXjNuoVUun0vWz36M3podkQM+yQyNTKnxVD6Jy
	Xn5JJBR4X/yyXAFuQ4BoJgo3JGUJmUbPl+5WWygZ0LlQeDN/r56xedh/MXjhnCbzMicBkVhtvQv
	Gx/bzSQYl9315KLcGNDIZ2g6IE2EXALmfFtrXR3RzPtpe5Yo7gGuEzF79qF3HbHgpJEB4nwGQ9e
	TPGbjCNWcyEciTlYvQle+AgWpVx3aQa1WzqAeVBHPbqzt2owBBuufKBx/huAFzQcCy9RGuLRVt6
	+5PXwHlTjuzWQWJkG9COpG4B3+q8Y3l6EUxIQ22DbBCm/ZYFJbQe9Ccq4+ynAoCIITwDZRoP9My
	UhX9UQViEA09gaZ/UU7cbuJ2
X-Received: by 2002:a05:6a00:4b0c:b0:89d:5a80:5256 with SMTP id d2e1a72fcca58-8c87bdb6bc8mr17944929b3a.9.1795620157634;
        Wed, 25 Nov 2026 07:22:37 -0800 (PST)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077a058sm9221775b3a.8.2026.11.25.07.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:22:37 -0800 (PST)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH 2/2] Bluetooth: RFCOMM: Close DLC on TTY registration failure
Date: Wed, 25 Nov 2026 23:22:18 +0800
Message-Id: <pm-bluetooth-objects-candidate-0218-followup-v2-88edfec8c72ed860e626-2@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-bluetooth-objects-candidate-0218-followup-v2-88edfec8c72ed860e626-0@gmail.com>
References: <pm-bluetooth-objects-candidate-0218-followup-v2-88edfec8c72ed860e626-0@gmail.com>
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

The TTY takes ownership of the DLC before tty_port_register_device().
If registration fails, dropping the port references detaches the device
but leaves the DLC open. In the reuse case the original socket is
already BT_CLOSED, so it will not close the DLC on release.

Start DLC teardown while the registration reference still pins the
port and its DLC. Purge any unconsumed receive data when the port is
finally destroyed, after detaching the device as the DLC owner.

Commit 77bc0f253ff9f ("Bluetooth: RFCOMM: serialize RFCOMM_CONNINFO
 dlc->session dereference") moved session reads under rfcomm_mutex.
The handoff therefore no longer needs to wait on the socket lock for
RFCOMM_CONNINFO. Use WRITE_ONCE() to publish BT_CLOSED. The DLC lock
continues to serialize that update with the old socket state callback.

Fixes: 56bc551ef79c ("Bluetooth: RFCOMM: Close the socket before transferring its DLC")
Link: https://lkml.iu.edu/hypermail/linux/kernel/2611.2/24606.html
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
This patch was written with assistance from Codex (OpenAI).

 net/bluetooth/rfcomm/tty.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/net/bluetooth/rfcomm/tty.c b/net/bluetooth/rfcomm/tty.c
index 745cf1e4bb2c3..43a03837e371b 100644
--- a/net/bluetooth/rfcomm/tty.c
+++ b/net/bluetooth/rfcomm/tty.c
@@ -96,6 +96,7 @@ static void rfcomm_dev_destruct(struct tty_port *port)
 	list_del(&dev->list);
 	mutex_unlock(&rfcomm_dev_lock);
 
+	skb_queue_purge(&dev->pending);
 	kfree(dev);
 
 	/* It's safe to call module_put() here because socket still
@@ -293,12 +294,8 @@ static struct rfcomm_dev *__rfcomm_dev_add(struct rfcomm_dev_req *req,
 			atomic_sub(skb->len, &sk->sk_rmem_alloc);
 		}
 
-		/* Finish RFCOMM_CONNINFO before replacing the callback
-		 * which serializes session teardown with the socket.
-		 */
-		lock_sock(sk);
-		sk->sk_state = BT_CLOSED;
-		release_sock(sk);
+		/* Serialize with the DLC state callback. */
+		WRITE_ONCE(sk->sk_state, BT_CLOSED);
 	}
 
 	dlc->data_ready   = rfcomm_dev_data_ready;
@@ -347,6 +344,8 @@ static int rfcomm_dev_add(struct rfcomm_dev_req *req, struct rfcomm_dlc *dlc)
 			dev->id, NULL);
 	if (IS_ERR(tty)) {
 		err = PTR_ERR(tty);
+		/* Close the DLC while the port still pins it. */
+		rfcomm_dlc_close(dlc, 0);
 		if (!test_and_set_bit(RFCOMM_TTY_OWNED, &dev->status))
 			tty_port_put(&dev->port); /* Drop the initial reference. */
 		tty_port_put(&dev->port); /* Drop the registration reference. */
