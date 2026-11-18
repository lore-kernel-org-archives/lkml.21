Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794961323;
	b=klbFHCM9ZZ2Mh7MuHR4r5YX/t2pgmzME62ZT/IMdMdS/l/kSjmGLsY5SpsCVUwYeDjXm
	 ie92iuk+DQidkOTT07m1ib1dyHU8KgUeydpZMaMogwenlCUkIOSkE5qV7Mche5Fhqzl8A
	 fXV3zhRYYWVUfZHUVtN9l930I0d6dmskcrXydQppYhzpJ5VNJNqeU9XXXGuBDAmZEpR7F
	 MO+hEcwgU1G0UTn5iOnYAwDLz/CFmhUluQfmNHQfSjX5Ix8OYouYcBdtyqLE+92O9f6OG
	 HKFIct6tmGXANYHMisQC0baCt39PIVjTfaKv4ulyTuOU71n29/If2gBJCtqr6aCmi8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794961323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3pL4qI55xeS4q74Qd8OgYkkf11qD+6PkbWN1emyH6OE=;
	b=QRK9i1IxG7i7ZqU8wZaTYyfSy1qYZhB8CeeW27nxNx7UjvmfUnNkM4IxNjuQZWlvRhTJ
	 h+rNEDBQmaWlZ7rWaoRedpjvyziif9CiQ28rxzSQtU4BAAgozb/BbxxQGppvWpLEZ6KXa
	 2ZEKRblGR2J+wOX/N6mn0YSbWy7LU/PjjlNILtvBLhCUWqmkVGHWM3wEaw+Q5j9TjmGcX
	 KMuqAjrMaF7vhBWrb7VeraD/RZHK3X1lPabZF2bD2oh2OHiEt9F1uEj6n/hRiwlkEq78t
	 dJls75IDsMu/Le42OBMP8SXbO7Kyy2I2jG7r4rBBTsBvGL9GCsneI47cn6kzHtRodug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q3jfxspY;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A79606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10A79606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q3jfxspY
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-170135e43c7so740911c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794961322; x=1795566122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3pL4qI55xeS4q74Qd8OgYkkf11qD+6PkbWN1emyH6OE=;
        b=q3jfxspYnnmIioOhnT9WDmbOP6gFnX+nkFOI7kWL1h+Kp911buehA+yTYCfvblGRh9
         ZWOHch3rQHqhIQAEPJa+Z+5kYNRUDvzeYEBOJ3nqxL/yy22hememUcsYbz3N8pV3IjiH
         D50KILEjYQhXC/K4+xfniLhGz1AePT5EA/NeXlau5vctxZJUG69xtxJSfsA+t7GuGvmK
         iTrtetAa/lEwdJWbVKP1+tJWNMbmqqcU0mPe4S1kLIXZjvAdzN4ZzZ9ij/ydQCcs0t8O
         Vckp+QP5ajZG3pihMPwv190bAIvIOaZw6Fl+skcA56hsR23mHhdQX2hLjYhGQzoSDBuP
         VXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794961322; x=1795566122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3pL4qI55xeS4q74Qd8OgYkkf11qD+6PkbWN1emyH6OE=;
        b=QRWoZccxJMQTj5azNJeruDGBqzJiL3r70NjdyrofcCyzi8OLiMhc8Z9Urip94fNBdF
         SDaFp7MtPYkjneA40YDVLBGZp8Xng5H9PUzeYRicC2ziyPWG07RM9fWtaNnvZfTZRJdw
         pP2PhAV8JvNQABtthCJpC71Lt06HvXgQuJCxlfdN8H/nIzA4sGr0rIGIrSbrUvkrJ2Zr
         lTFx9+//TCMCjCCs17o44HcFgtNB3FKzXQtaMK1z5AqWT02w7lP+MOhwrCzQe2d6D02F
         s9G0kuRvpDblQbwRtBQbKDMq9yIhunVHlWEI+/5BRSrWR/o69BmONOK5+X571bdLeS7p
         ftkQ==
X-Forwarded-Encrypted: i=1; AL+hErGKpiavxQKVTMIN885XhTZeFhIjzA4Uz8NuYR743V4lefGhHmZkF55VfN3yMkNU4J+76NuZOOzs8T9RtKA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dQmF3FeCSTBW+hgPlwR2hEx1T8Q4tC7IEnLqNy1C4EzGJXK4G
	9FCycFPfNbhX+9mpWKDxwzu4+4d5FJTbdwAwKUnU42/SCXtV81VlgZ7R
X-Gm-Gg: AYBFou0CTBpuCJPQXYVxWz0f5rKXJqhJLBPCj2SmI5rJeUhrbon6rwWbuDmdftwlS1E
	3FnTi7jt4te7vVeq3qJ5Z680bQpAu3IKPMDVM5p0K4znzGXwksx+n+YgXQNKhZ8fBSLyrRauJU1
	N5YkdacK18SX8JSZWFNRUya9EEbPUqg+UkPxRml3xsVzEHSKlgULZpO5Y7eEzjPnbOnuHb9dwR0
	VbQ+t8HNOds+tiWlPdAm3tBjkToK0j7YPnfM94T5ImovFbH6zLUV2zDgNbhyh1gVV0sQcHcfZvO
	hA8Sgsu+rLjlSIIBQe0VYirZyXDPgpUkiwSB72Z1yI6FIJNiRr8qo6tFDKXSsLXgC65K8L8565h
	dKSub/ww17bLV1yw35/yOF4zRDNlLCcCqbQtcddWYfzOzF90wpxxTg1/JOitJRr2M9FKBlhJSjd
	MU6DXHed+HUUltblaLpkvUtu5Slw5VuzEqCA1RlcHwO7fYUqorR5IOj8QgjNmIkL3cIpmmnrkwp
	HMoCvMGKuCpLHhSziXi1W7h1G3YHNEityp2YfUKebaSdR6bsBXAgSgPKHNp//Wu2Bo5WspVIiwr
	3XGtUdBjmSlUB/gdnrI+OeEf/WM+cjqpGJPues2zmbW2zXaFbcvNBJCe+rWubVZh1ANcBXow+2v
	PFwU/Q/V9/mYKG/3ErwppKT3xN5A90edN+8d1i8cKNNFqtb69Fw==
X-Received: by 2002:a05:701b:2806:b0:1a4:c892:b130 with SMTP id a92af1059eb24-1b543beb5bemr978760c88.15.1794961322120;
        Tue, 17 Nov 2026 16:22:02 -0800 (PST)
Received: from localhost.localdomain ([2601:646:4300:d042:b1a7:bebf:2fc7:37b1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5446f954dsm1665354c88.2.2026.11.17.16.22.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 16:22:01 -0800 (PST)
From: ozgun kultekin <ozgunkultekin@gmail.com>
To: Paulo Alcantara <pc@manguebit.org>,
	linux-cifs@vger.kernel.org
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>,
	David Howells <dhowells@redhat.com>,
	netfs@lists.linux.dev,
	samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] smb: client: do not let the server grow a write subrequest
Date: Tue, 17 Nov 2026 16:21:59 -0800
Message-ID: <20261118002159.20576-1-ozgunkultekin@gmail.com>
X-Mailer: git-send-email 2.56.0
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

smb2_writev_callback() takes the byte count from the SMB2 WRITE
response, masks it with 0xFFFF if it is larger than the request (for
old OS/2 servers), and then copies it into wdata->subreq.len.  A server
can return a count that is still larger than the request after the
mask, for example 0x8002 for a 5-byte write or 0xFFFF for a 4 KiB
write, and the subrequest then covers data that was never sent.

netfs uses the subrequest length to decide how far the write collector
may advance.  With a grown subrequest the collector moves collected_to
past the data that was issued: netfs_writeback_unlock_folios() walks
folio_queue slots that were never filled, and
rolling_buffer_delete_spent() frees folio_queue segments that later
in-flight subrequests still use.  This is a use-after-free that a
malicious or broken server triggers from an ordinary write:

  BUG: KASAN: slab-use-after-free in netfs_limit_iter+0xed4/0x1040
  Read of size 1 at addr ff11000010561511 by task kworker/u8:4/63
  Workqueue: events_unbound netfs_write_collection_worker
   netfs_limit_iter+0xed4/0x1040
   netfs_retry_writes+0x1410/0x1e90
   netfs_write_collection+0x2647/0x3880
   netfs_write_collection_worker+0x1cd/0x3e0
  Allocated by task 141:
   netfs_folioq_alloc+0x39a/0x470
   rolling_buffer_init+0x29/0xc0
   netfs_create_write_req+0x12f/0x840
  Freed by task 42:
   rolling_buffer_delete_spent+0xb1/0x220
   netfs_write_collection+0x1f62/0x3880

Never change the subrequest length from the response.  If the count is
still larger than the request after the mask, fail the write with -EIO
and record it with a new write_overlarge trace point, like the read
path does with read_overlarge.  A short count still returns -ENOSPC as
before.

The folio_queue form of the use-after-free exists since
commit cd0277ed0c18 ("netfs: Use new folio_queue data type and
iterator instead of xarray iter").

Fixes: 3ee1a1fc3981 ("cifs: Cut over to using netfslib")
Cc: stable@vger.kernel.org
Signed-off-by: ozgun kultekin <ozgunkultekin@gmail.com>
---
 fs/smb/client/smb2pdu.c | 17 +++++++++++++----
 fs/smb/client/trace.h   |  1 +
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
index b26bfb4bd..2f05ba613 100644
--- a/fs/smb/client/smb2pdu.c
+++ b/fs/smb/client/smb2pdu.c
@@ -5181,14 +5181,23 @@ smb2_writev_callback(struct TCP_Server_Info *server, struct mid_q_entry *mid)
 		if (written > wdata->subreq.len)
 			written &= 0xFFFF;
 
+		/*
+		 * The server must not report more bytes than were sent.  netfs
+		 * uses the subrequest length to work out which folios this
+		 * write has finished with, so it must not be changed here.
+		 */
+		if (written > wdata->subreq.len) {
+			result = smb_EIO2(smb_eio_trace_write_overlarge,
+					  written, wdata->subreq.len);
+			break;
+		}
+
 		cifs_stats_bytes_written(tcon, written);
 
-		if (written < wdata->subreq.len) {
+		if (written < wdata->subreq.len)
 			result = -ENOSPC;
-		} else if (written > 0) {
-			wdata->subreq.len = written;
+		else if (written > 0)
 			__set_bit(NETFS_SREQ_MADE_PROGRESS, &wdata->subreq.flags);
-		}
 		break;
 	case MID_REQUEST_SUBMITTED:
 		trace_netfs_sreq(&wdata->subreq, netfs_sreq_trace_io_req_submitted);
diff --git a/fs/smb/client/trace.h b/fs/smb/client/trace.h
index 5331ce6dc..18760a819 100644
--- a/fs/smb/client/trace.h
+++ b/fs/smb/client/trace.h
@@ -153,6 +153,7 @@
 	EM(smb_eio_trace_user_iter,			"user_iter") \
 	EM(smb_eio_trace_write_bad_buf_type,		"write_bad_buf_type") \
 	EM(smb_eio_trace_write_mid_state_unknown,	"write_mid_state_unknown") \
+	EM(smb_eio_trace_write_overlarge,		"write_overlarge") \
 	EM(smb_eio_trace_write_rsp_malformed,		"write_rsp_malformed") \
 	E_(smb_eio_trace_write_too_far,			"write_too_far")
 
-- 
2.39.5

