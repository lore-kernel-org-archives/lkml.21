Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176989;
	b=4Np+SpquvOycF8ssPCqWZI6Nc4rDaaWPEQkSZdxoqdOtyhuE6i6qxRtpG7QGRB2CH6UG
	 kmA1I6d1BaN0ErWrE8C9nvzonleN1jHimqbNkmh4nU5sPwCW+nmrDXLpA9SOeKXPZM5EZ
	 BlDrnMUAAlMVKb6cyNmzSa86Y5FTMb9TatMNDk55yZEcY0I7I5STYKTZZFeqnYlJ2lEdL
	 0SnTADDfNrUq4j+8AARP9EPJarxDQHIMDOoiMy0OUGQdNutuofiOfalFinMLFX0fNeOOw
	 Yi/fTEfQnmBACpFJuuaiZIkMgYvFSyNDdX6bxZDLgwLKPw/rWTznLwrb7MlRfHdEhlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mlU16s7/03iuntqpjZE6TiJEWGLy8t92iax2eFIVvl0=;
	b=dlLWKgPM5oGVfdMEm/dn9mdEfFbEN/qCXKEWXzrktGsD5DxDISfjTA9pvU9PSW90A/w4
	 NmnkImq8YkYM3F0TYQ0MbsOjxzex/N9s4TSTtz6J8PAlktALQ3JgKKSBWUAcZcOnnoHzc
	 jlOmSSLs6nAxIIPpRqPDoXThHVA3cJYFI5V2hkGo4X8IE6CnattUl2wmcvhSRDQ4d98hc
	 EDjE9ycaSN0oNWObmNDvoJ9WTaQDPwcGLEU6NQjxpd/S8iZ3fKwPIXbKHItYIW512OsVJ
	 IiF7evPgjkqOAlceZ7ZbIH7yn65zZxFsqCbakeXXkr/o7nuWYySHRQKczb6nBiLNi0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=kfoOGbry;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB7B606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DB7B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=kfoOGbry
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b41e627cadso474935a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795176988; x=1795781788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mlU16s7/03iuntqpjZE6TiJEWGLy8t92iax2eFIVvl0=;
        b=kfoOGbrycMj8gAlPRrvZhLEE5plzWJ0rrbPCTwN+YUDLqGJQdo1WQ17IOvMdC15jdU
         mr3j4t5KGIf8SFTp5sO/TNcd6BSQn2Kkca/VHP0ApcOOmg7osWK3xsmQ23+jvFXFyngM
         m8VrmCyduGhEwissLMQLwfiFq8D6qRz3k1yOB1bcw+Mn4AzKP9du+CTeAnUTkbqBAJIe
         QgGQYfRfrlteoMTJIT+MmcwZMlPk42hxXkZCqc/u0dxfyHucGPLHuYo0weA6fcAYMQpy
         qE+FLWfN+k/iHHxiBCN87IX85FN4shl0lDL44aU68093YWxA1DVYYXRNh52C3oXkBmW4
         Or1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795176988; x=1795781788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mlU16s7/03iuntqpjZE6TiJEWGLy8t92iax2eFIVvl0=;
        b=yV6Ybv7zPElCww/eMSAhjjENMsHIvfZmWWl00qsX6TRKmQykOqu9AsyNtiWSC00MiL
         SPN7W9G7I/UEzGGkXoSQa4NHIFucfhMYusl9LUiFwKnvfkmiPZuCsdrp1dA+efo8GVsF
         qA1fwyjKRPclTFUbv0iEzfD48u147ht24yMmIPluKqTnUwGTPKkSvc/kuO/pv8tF9IjA
         LZaADwaNU3MyPaVlGBPwRxN41VJXGoYT+7TJjP8dB1ZryxisOTqcpxsZscoc17QB0cpv
         n0c0ylKZADiv9RxlFQ9jcw+8ixDJmvuuNaYrCwUx+PmlnvZAUGPBAS5l6ESKqcX2sw9X
         RAnA==
X-Forwarded-Encrypted: i=1; AL+hErH5fTH6fKnV/3IVywqiQcz3H0I7PMqx40zzjyyyEpuekjOqSCtzSRbYFtTL5r/Z+XEwsg0O70tnl4nQ/3g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NkgC9iUtgQBgmVWeWL1DBjnxLhh+N9ioxWVMwpSYQcucFYjrh
	cSZFkIBYJI9PNFUq3E7hwddg1Z4A9nNqu4204BiCCw2kWYhsaTPVZ1W6KrgUJ1XYg3w=
X-Gm-Gg: AZFdTZeKv1K88UvtuzCGuzuj3XkJXReyXh6OIeXnHcVanixPzkogZ1bjj31QmGQvHmY
	BuwQc/690DlxPZbH4LriF8pygw9UbZzLX6Y4FrJm7nvDDOu9g1tzy1HlSGzGFX37QkWjBx4C/eS
	kWezcPPY8PSvhn46/AmNcN+b/pvzHT4I14POj6QxKpLDxU7BEWcQ1AZHiQyjub2BEqCy1TYi0HR
	HUNamth9ZlKYF7gpIl3GwLYdTakqW04Y8g40CV95OZqLb5VYeirZZXFcRuHfSgGT+mTYldFdoUV
	66x9foug1c9sLa9lCqEb7QyJETtraIE2tqkOcnJQPpO4k27cC5KJJDbhICGBFHYTAUd8F/E9skA
	jyZv84L8VDLUp3ZGvxI1wBzWf2CeCWb2Cl7lt8/T33uA+DyCbCR6IWTkDOuNv1PgpFI/qA7a/U6
	88qBOlRD1ESNQtlLOJvKOh7Ay9njsX5u15NtdhpX4LhTAa7TM1whBh3GxC/UkU4ghP1ithrN88G
	wwVVvK7ok+T0cYjhaLdr5EdwdTRLMa4Hkxhor9c0TwbsUIQbC/yDpEd8f7nPryM3MKg7zZTtm1p
	NuX8ctwHXc2Uj+gYn9ldaHxlJo6F+eG+WtOE
X-Received: by 2002:a17:90b:5289:b0:3a4:77b8:1770 with SMTP id 98e67ed59e1d1-3b41c8fe855mr3017017a91.15.1795176988548;
        Fri, 20 Nov 2026 04:16:28 -0800 (PST)
Received: from rmustafin-laptop ([27.79.41.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm4463146a91.1.2026.11.20.04.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:16:28 -0800 (PST)
From: Rustam Mustafin <rmustafin@cloudlinux.com>
To: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Shuah Khan <shuah@kernel.org>,
	Jaewon Yang <yong010301@gmail.com>,
	linux-integrity@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rustam Mustafin <rmustafin@cloudlinux.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] tpm: Track the response read position internally
Date: Fri, 20 Nov 2026 19:16:13 +0700
Message-ID: <20261120121614.978396-2-rmustafin@cloudlinux.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261120121614.978396-1-rmustafin@cloudlinux.com>
References: <20261120121614.978396-1-rmustafin@cloudlinux.com>
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

tpm_common_read() indexes data_buffer with the caller supplied *off.
A read issued through io_uring reaches the driver with that offset:
loop_rw_iter() passes &ki_pos to ->read(). This allows out-of-bounds
reads and zeroing of kernel memory:

  BUG: KASAN: slab-out-of-bounds in _copy_to_user+0x4b/0x70
  Read of size 16 by task iou-wrk-148/149
  Call Trace:
   _copy_to_user+0x4b/0x70
   tpm_common_read+0x16e/0x2c0
   loop_rw_iter+0x235/0x5a0
   __io_read+0xc6e/0x11a0
   io_read+0x8a/0x180

A plain read() racing a write() reaches the same access: read()
samples f_pos before taking buffer_mutex, so it can consume a new
response from the offset left by the previous one:

  BUG: KASAN: slab-out-of-bounds in _copy_to_user+0x4b/0x70
  Read of size 75 by task trigger/151
  Call Trace:
   _copy_to_user+0x4b/0x70
   tpm_common_read+0x16e/0x2c0
   vfs_read+0x189/0xc00
   ksys_read+0xf9/0x1d0

Replace *off with a read_pos member of struct file_priv. It is only
accessed under buffer_mutex, so the offset passed by the caller no
longer matters.

Fixes: 9488585b21be ("tpm: add support for partial reads")
Cc: stable@vger.kernel.org
Signed-off-by: Rustam Mustafin <rmustafin@cloudlinux.com>
---
 drivers/char/tpm/tpm-dev-common.c | 11 ++++++-----
 drivers/char/tpm/tpm-dev.h        |  1 +
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/char/tpm/tpm-dev-common.c b/drivers/char/tpm/tpm-dev-common.c
index ee91f456f975..553fc6aca94d 100644
--- a/drivers/char/tpm/tpm-dev-common.c
+++ b/drivers/char/tpm/tpm-dev-common.c
@@ -107,6 +107,7 @@ static void tpm_timeout_work(struct work_struct *work)
 	mutex_lock(&priv->buffer_mutex);
 	priv->response_read = true;
 	priv->response_length = 0;
+	priv->read_pos = 0;
 	memset(priv->data_buffer, 0, sizeof(priv->data_buffer));
 	mutex_unlock(&priv->buffer_mutex);
 	wake_up_interruptible(&priv->async_wait);
@@ -149,21 +150,21 @@ ssize_t tpm_common_read(struct file *file, char __user *buf,
 			goto out;
 		}
 
-		rc = copy_to_user(buf, priv->data_buffer + *off, ret_size);
+		rc = copy_to_user(buf, priv->data_buffer + priv->read_pos, ret_size);
 		if (rc) {
 			memset(priv->data_buffer, 0, TPM_BUFSIZE);
 			priv->response_length = 0;
 			ret_size = -EFAULT;
 		} else {
-			memset(priv->data_buffer + *off, 0, ret_size);
+			memset(priv->data_buffer + priv->read_pos, 0, ret_size);
 			priv->response_length -= ret_size;
-			*off += ret_size;
+			priv->read_pos += ret_size;
 		}
 	}
 
 out:
 	if (!priv->response_length) {
-		*off = 0;
+		priv->read_pos = 0;
 		timer_delete_sync(&priv->user_read_timer);
 		flush = true;
 	}
@@ -214,7 +215,7 @@ ssize_t tpm_common_write(struct file *file, const char __user *buf,
 
 	priv->response_length = 0;
 	priv->response_read = false;
-	*off = 0;
+	priv->read_pos = 0;
 
 	/*
 	 * If in nonblocking mode schedule an async job to send
diff --git a/drivers/char/tpm/tpm-dev.h b/drivers/char/tpm/tpm-dev.h
index f3742bcc73e3..34efb1ffa491 100644
--- a/drivers/char/tpm/tpm-dev.h
+++ b/drivers/char/tpm/tpm-dev.h
@@ -15,6 +15,7 @@ struct file_priv {
 	struct work_struct async_work;
 	wait_queue_head_t async_wait;
 	ssize_t response_length;
+	size_t read_pos;
 	bool response_read;
 	bool command_enqueued;
 
-- 
2.52.0

