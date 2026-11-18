Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037331;
	b=gNgQzS8VOsxQLweHDt55j0rJz/tQ1ts+ofrYWoudHpWa/zVOzsCuTzn2rZXIp5xNX6Uv
	 UttqRP+2BTFhGODWERcGC+yMmoySTOY4ySltLXLLQaBtFJowTZyQfieKIAobBIDdo4DhA
	 WbU/nfIuubjrBQlVtDGcuo/sDPoYFG8iWYrJG4kFp0txaNfT5eLn7HHeWagjQbX7dzP3t
	 MPJIQ/iIl/6d25/o3XPTeH+HecnDPxaFy946DyHOVebPreodcE7RZqfpvRiN9yE+YueLp
	 tMlOnj3gAMX7sV9+10xXe85VslAfE7BfY4cNP8v9P2ABUnwqWQOrYU1ck4LVQegwDJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=rcOKrKC5VH2EJYd32jje86IEEuy7ivHNpMjvoLy4Pag=;
	b=49A27dQWWbSSSeW3+s4ONAYZDAULGCJyKtfIhIENfRRZzDx5KQFSh6VgaX/6DVxGz0ch
	 AvFU/ksg3xOAp/2TigRKjF0ln5S5PcDUnNZbyD2McnqX7wgFZcQNaBigL+syLnSDmHM9O
	 5C1nbFYYRqLZbHYVgV9Zv3CwD9abGMmK3jrJQxOIT6x4WSSGAgA4fTb4tOvSHR9tJ4Tma
	 6wGfKTv+haUddeWlG23R1WmwROLBKOUuUSPmn4YnTlqo1nTskYfxq4/i8sJrpxSl8bc9M
	 k0xpuQvgIaS8mbfep7Rxgz5enidXTkGBUWPmn1kHo82ViWMXFFUHJd1diafUu/6sxDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=dKq2+911;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FC7606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25FC7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=dKq2+911
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7cc3eb09dd2so466598137.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795037330; x=1795642130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rcOKrKC5VH2EJYd32jje86IEEuy7ivHNpMjvoLy4Pag=;
        b=dKq2+911V6f3mCCoT91q/B9EbEcgcYC0SU7+8anT0+yvtrnieQqhFUpIn0r5IIRTs+
         taFjPr07zKynB4iZMS//Evj2vbQH+Gk8TKX79XLD7/2Gy2i4L+bSwwZ+abqAQyxWLXsa
         rkPbQxZdq7LvVQK+iLNWnkQa5K8UZeEdioFzPaEZ8d1ehXcx40qoovh60BbUhGHO7Gog
         Zk/TNqn1xrtbFs/066P/9WgrQtxlV0WqdS7gtIhvsogGvcJyYchXWciHjPYTP4ncgl4y
         yTogek1Hjokaqs0C9ffnH6OWITg9H6AKkJDuBM5A81RWG/YPfP+MDPbn5fz7OgKPJtZp
         3Kkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795037330; x=1795642130;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcOKrKC5VH2EJYd32jje86IEEuy7ivHNpMjvoLy4Pag=;
        b=VHwSwGKdctYPEGOGZRcF9KhtgD3SwCfUfl/yw0W0odIkoauDsVC4u1r2ouOhwtXbk+
         Cc3YH/UihjUev1/zznoz2E2w+XfEN3L8bEu/dlr6I3x7jRzaz3BJaEEylgy9mDx2KKJU
         /idgCdGg7jCeiuRqBNivWru9Q58dY7fLZWGyLA1Ztkd9d3j/Dy02sBRuURsK1fA3VyUx
         AISTQBnWcuHnf89269QG7b5FBocvjIzk+Kl/1Qz+2NVdde5bWOUFE6ohEwpGFhr1Mc9o
         equxTfsEWxCkbSuY45YGrOYLIiOyOtsSlsLrqxSa8bSgwJ7g36hduTZJjmqbWOwD+mdh
         12+w==
X-Forwarded-Encrypted: i=1; AL+hErGjk0tWUsrpVzsiW1eb8oS/omDZ9VuG8Rkyoy2ALkU+3z6b7t1X5BpbndPWuNxock8ytMvmxjwGjhEXErQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Oy/IdviKECw7IrAMUIItOoShP7f6s0CIM5Hvc3+fgqTGxaFPp
	TwIp7/gX+kf++YYarZr9Z5kW0L3P5Jvgt2EhCnTqHk1rDu38EHA6Xp+NR/S/rpEli8g=
X-Gm-Gg: AYBFou1Z7oqcuHDXX60U2hdzMXZlXkhzJNmvPf35EjREvuEFUxyt2s4LJeaDelHGtFD
	1JU1XGOmBnUHi/oUf2/heOTeQMkWpkDXVzP8lDHZPAVS4vfzA1nmjpUXgAyT1C2/H+Rdt1YkCOa
	LqT+wN7GoeuZMvTVkbWWyXZdv5Htd06cGal1RcJaMFH2h9yW5lfq7SG9ZqBvvBQhRNnV+oBVCvV
	QVmwGhxCZTmb1ddFhD9+RXxGZcbFdxatEvKIaawagyIMm+sJLuk+dJ5+2ROqfWz2q94o/BqDmK2
	DVyrFKJC2cl0v7RjSdLqzJBXEaVYne5p66NnQjv/J0QQMNeTPdTC82cWoEY6QMJbnA1UlxY+se8
	Jyp+rO9PJII1e+xLh5OTP7r0zsh/CTX1AhxzlFbKjtjq3yLwGGEcY5/wLEQw4ngNI1cswrNaS6w
	3ih7BYEasGfQoUw61GpOWrm3BlvlhQ2qi1/izRovZo6Aa9u9RA00P0IBsNIOyoQqlDu58DllUDC
	Gl4f5Qwr3qryjXmKP5Wpgr9jcisPNtfdYLnS8QcP0k8FB5aH+Bk5zGzPYJ9NRp2znmbHZltDoPy
	A4Lo1XFLr7OfJqyXI7H7cXsZMNMQU4mzO+G6FESdn05NZunqOeUQL3n7CcpPr97+1q/2GG91cre
	ZkZUEmhXT8QgVF3PI4QcWsm5eqXuQh0txWwobWmDUQ7U2M0pIAzJT
X-Received: by 2002:a05:6102:2d03:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7d6ba480612mr1670329137.34.1795037329535;
        Wed, 18 Nov 2026 13:28:49 -0800 (PST)
Received: from soleen.c.googlers.com.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6b9185bc3sm2724635137.5.2026.11.18.13.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:28:49 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	linux-api@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	graf@amazon.com
Subject: [PATCH v6 1/7] liveupdate: Move file_set_ser handling to luo_session_serialize()
Date: Wed, 18 Nov 2026 16:28:36 -0500
Message-ID: <20261118212845.2855249-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
In-Reply-To: <20261118212845.2855249-1-pasha.tatashin@soleen.com>
References: <20261118212845.2855249-1-pasha.tatashin@soleen.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In preparation for allowing userspace to freeze a session explicitly
before kexec reboot, luo_file_freeze() and luo_file_unfreeze() need to
be called on session->file_set before any struct luo_session_ser entry
is reserved in luo_session_serialize().

Currently, struct luo_session_ser is populated and cleared across two
layers: luo_session_serialize() writes and clears ser->name, while
luo_file_freeze() and luo_file_unfreeze() write and clear
ser->file_set_ser.

Drop the struct luo_file_set_ser pointer parameter from
luo_file_freeze() and luo_file_unfreeze() (and struct luo_session_ser
from luo_session_freeze_one() and luo_session_unfreeze_one()), and
populate and clear all fields of struct luo_session_ser in
luo_session_serialize().

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_file.c     | 24 ++++++++----------------
 kernel/liveupdate/luo_internal.h |  6 ++----
 kernel/liveupdate/luo_session.c  | 19 ++++++++++---------
 3 files changed, 20 insertions(+), 29 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index a39992da504f..988eb313a135 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -440,8 +440,7 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
 
 /**
  * luo_file_freeze - Freezes all preserved files and serializes their metadata.
- * @file_set:     The file_set whose files are to be frozen.
- * @file_set_ser: Where to put the serialized file_set.
+ * @file_set: The file_set whose files are to be frozen.
  *
  * This function is called from the reboot() syscall path, just before the
  * kernel transitions to the new image via kexec. Its purpose is to perform the
@@ -457,8 +456,8 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
  *
  * 2. Serializes Metadata: After a successful freeze, it copies the final file
  *    metadata—the handler's compatible string, the user token, and the final
- *    private data handle—into the pre-allocated contiguous memory buffer
- *    (file_set->files) that will be handed over to the next kernel via KHO.
+ *    private data handle—into the pre-allocated serialization blocks
+ *    (file_set->block_set) that will be handed over to the next kernel via KHO.
  *
  * Error Handling (Rollback):
  * This function is atomic. If any handler's .freeze() operation fails, the
@@ -471,8 +470,7 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
  * Context: Called only from the liveupdate_reboot() path.
  * Return: 0 on success, or a negative errno on failure.
  */
-int luo_file_freeze(struct luo_file_set *file_set,
-		    struct luo_file_set_ser *file_set_ser)
+int luo_file_freeze(struct luo_file_set *file_set)
 {
 	struct luo_file *luo_file;
 	struct kho_block_set_it it;
@@ -506,9 +504,6 @@ int luo_file_freeze(struct luo_file_set *file_set,
 		file_ser->token = luo_file->token;
 	}
 
-	file_set_ser->count = file_set->count;
-	file_set_ser->files = kho_block_set_head_pa(&file_set->block_set);
-
 	return 0;
 
 err_unfreeze:
@@ -519,28 +514,25 @@ int luo_file_freeze(struct luo_file_set *file_set,
 
 /**
  * luo_file_unfreeze - Unfreezes all files in a file_set and clear serialization
- * @file_set:     The file_set whose files are to be unfrozen.
- * @file_set_ser: Serialized file_set.
+ * @file_set: The file_set whose files are to be unfrozen.
  *
  * This function rolls back the state of all files in a file_set after the
  * freeze phase has begun but must be aborted. It is the counterpart to
  * luo_file_freeze().
  *
  * It invokes the __luo_file_unfreeze() helper with a NULL argument, which
- * signals the helper to iterate through all files in the file_set and call
- * their respective .unfreeze() handler callbacks.
+ * signals the helper to iterate through all files in the file_set, call their
+ * respective .unfreeze() handler callbacks, and clear the serialized blocks.
  *
  * Context: This is called when the live update is aborted during
  *          the reboot() syscall, after luo_file_freeze() has been called.
  */
-void luo_file_unfreeze(struct luo_file_set *file_set,
-		       struct luo_file_set_ser *file_set_ser)
+void luo_file_unfreeze(struct luo_file_set *file_set)
 {
 	if (!file_set->count)
 		return;
 
 	__luo_file_unfreeze(file_set, NULL);
-	memset(file_set_ser, 0, sizeof(*file_set_ser));
 }
 
 /**
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index dac6644bfb18..01a172cd9d7a 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -103,10 +103,8 @@ int luo_session_deserialize(void);
 
 int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd);
 void luo_file_unpreserve_files(struct luo_file_set *file_set);
-int luo_file_freeze(struct luo_file_set *file_set,
-		    struct luo_file_set_ser *file_set_ser);
-void luo_file_unfreeze(struct luo_file_set *file_set,
-		       struct luo_file_set_ser *file_set_ser);
+int luo_file_freeze(struct luo_file_set *file_set);
+void luo_file_unfreeze(struct luo_file_set *file_set);
 int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 		      struct file **filep);
 int luo_file_finish(struct luo_file_set *file_set);
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 74bc66929f4b..6dea35911181 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -219,18 +219,16 @@ static int luo_session_finish_one(struct luo_session *session)
 	return luo_file_finish(&session->file_set);
 }
 
-static void luo_session_unfreeze_one(struct luo_session *session,
-				     struct luo_session_ser *ser)
+static void luo_session_unfreeze_one(struct luo_session *session)
 {
 	guard(mutex)(&session->mutex);
-	luo_file_unfreeze(&session->file_set, &ser->file_set_ser);
+	luo_file_unfreeze(&session->file_set);
 }
 
-static int luo_session_freeze_one(struct luo_session *session,
-				  struct luo_session_ser *ser)
+static int luo_session_freeze_one(struct luo_session *session)
 {
 	guard(mutex)(&session->mutex);
-	return luo_file_freeze(&session->file_set, &ser->file_set_ser);
+	return luo_file_freeze(&session->file_set);
 }
 
 static int luo_session_release(struct inode *inodep, struct file *filep)
@@ -657,13 +655,16 @@ int luo_session_serialize(void)
 			goto err_undo;
 		}
 
-		err = luo_session_freeze_one(session, ser);
+		err = luo_session_freeze_one(session);
 		if (err) {
 			kho_block_set_it_prev(&it);
 			goto err_undo;
 		}
 
 		strscpy(ser->name, session->name, sizeof(ser->name));
+		ser->file_set_ser.count = session->file_set.count;
+		ser->file_set_ser.files =
+			kho_block_set_head_pa(&session->file_set.block_set);
 	}
 
 	if (sh->count > 0)
@@ -676,8 +677,8 @@ int luo_session_serialize(void)
 	list_for_each_entry_continue_reverse(session, &sh->list, list) {
 		struct luo_session_ser *ser = kho_block_set_it_prev(&it);
 
-		luo_session_unfreeze_one(session, ser);
-		memset(ser->name, 0, sizeof(ser->name));
+		luo_session_unfreeze_one(session);
+		memset(ser, 0, sizeof(*ser));
 	}
 	up_write(&sh->rwsem);
 	up_write(&luo_session_serialize_rwsem);

base-commit: 079c138d2b6870bb658b6e638077264aefc03833
-- 
2.56.1.708.g77570a6a1d-goog

