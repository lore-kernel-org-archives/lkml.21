Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795143382;
	b=vs8Za8Nr62rrZxRO5tiMZNOuHiUu6WHwQIiDG5qngZVw1BT0w1hAQ/ko2nnsWVRNJkKv
	 iqB4GhF0FFVP/moSmBpbXW4UN2GoJ0spwgkbOhPqa8z7N9rymX+IX1bl8T/PNB6Cz7d0y
	 MgTWwJ1O6r1oU2u3gfurk0puzdyK72WxX8LG9I/HSXME4tB7DhcEmuWIqNrcQGmIJL9Y/
	 p8Hvf+lK+3QSHEv3ILIKq17KO+ZAlk9Urtmt3g8buxr0uXpVWHadaHnhf2m3voOr/TrKT
	 dC29UNJErVmMtcNNN5XiNhDN2kwMc31uY6+3FGG5hl+se3bxaZsvJT11ZZ1C7iUNx3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795143382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Caoanj/q2zuB5Qe0Ofd0VM/ctXIcqUG18uCi126/kHM=;
	b=YAOwcllXPOeYvYUoERnEmDgjesqDLvx8WjjGZw4A2iBBqzhXGHGApNVTP0X/wWtx4D3d
	 YV00IzUa6xEitOend8M9VFaKul9C9cO76brGMLQlNCZPcM2OO80uQfCsIRls1h1WwDFB2
	 EM0wRSAHyX7vvXs0fY97YzqZNGFkQzsIJWSO8/2XVPluSzKvih/6jH9PZ7ZIzREqAdaC3
	 8vESb55k55PbKYKpBI6O5Kr2pXPgQBlbssrPzw7sMX+aqO1uyYRFXlDq9n7LOvn6kh7v8
	 bUO6jq4aY0Jwr9MUuHAF4PrfWSr2P5tLofJsqS0SZo5tke+eJtj0Mbb7P7bZsyKZfyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=smartx.com;
	spf=pass smtp.mailfrom=smartx.com;
	dkim=pass header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Vp6+Z4c6;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAFE60A2627
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FAFE60A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Vp6+Z4c6
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so299132a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20260707.gappssmtp.com; s=20260707; t=1795143382; x=1795748182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Caoanj/q2zuB5Qe0Ofd0VM/ctXIcqUG18uCi126/kHM=;
        b=Vp6+Z4c64SIRhY77FfO5UKECB3CnezZ9muL35DU0H9+vcm8Ux/SFrncYAQ6mZ1k5r8
         isETXxblW/89nzT0vNQjr+cyyLW0SHKZbLwRN3TiNFwDeZZUf1W2wEIgxOQ9uN8D8oS9
         Ujcpm7i0/NA35oY14/QimjW8jyOw24CH0+qrH7IM+thdfHQgd8Rr1wYxQQTbjgMmVSEH
         PGGhjTpoQELzPrq5CXZPdzrLzwawJkMbVJYkRH4xHVipHTuJa9q8SpGcYzB8P5B98v4Y
         VpXj8g1wlw4tFuwQLSpxZt8Nmg0whGNrwbTPBIqLxOY//hGGMHdyDP5rePBy8+f5RrQQ
         rCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795143382; x=1795748182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Caoanj/q2zuB5Qe0Ofd0VM/ctXIcqUG18uCi126/kHM=;
        b=Xir8kyyltLy0ATeAduH3/1/H0ZbCpog44Pj3sihI1JEKv++8C3N5bpXq9A67gYdfy1
         nrSopnWfH6SfQ4zq3Csg9PQmwldjopGIJKOOrQgNfpkYTQpOf1Zcv66p+rjsDsHEjGbk
         doRNKcngMFi2w89ZXvT86Z/947JGhjBpo2D/WXovpBcxNSivCkPSph56kgm6/UodkGGN
         xmM5W5hSP7TX//KFdHXeCWWqRkYiuS6KriMD+k9KN8rT9/HEAgggtqng6SjDQwM+eGvF
         sN2b47hxpma9t5DE6sBrO9YHa0oHUtCyXOVDv/oavVPY7D2dtV3AFc+wDU5iGWQ1pxa1
         AvXg==
X-Forwarded-Encrypted: i=1; AL+hErGZjG8x3nu7K47z5VA1/yyyhxKpIu0jWgJWa5FP7tVaAKKLyYSNCsVtVQd4BjiAuN05oNjRNklVVsoWsks=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VYpw6z4HIqPbysKRrQNkMDlndaaWtdu5OoFxSVzDWLgAnnfTN
	ctM6pGYZEfxET+CM3xEGT3DQ2IruAz89A3EHJYRU6RYoQ5OwJNfPJUlCk2JEKFEPqf3c9CADImg
	Lwfo01qe4QXkciAjZbQhqJQOwuCwXP2Mm+YFKOjfk4JeDBU48dH9Fl3w4k+8=
X-Gm-Gg: AZFdTZfAoz+LYL1bE8RupU3em5+UKWERYicZ123npnOwUHLm4caAtfq5/eeQk/EImP5
	6wNWrobEUp81Vi1PK6+CAgaE1O3oszAoL1J0fHE2x3VgqSzzU9adK3Babh2GG14SEPR9140DD1Y
	YAmO6/S1IYrt3qqyykHUS8C0652xULa3s/O1pu65eEb08qm66nYiLmfLMiZ5uBHc4kmj4EuZqFu
	ICRwGjXu4heF/D7KmdjxMXiFBj06ACOLR15CnEMkTbdjtoVnI0Wx+JzohI0zMnF2q0ibGXlwf7v
	GgO9e2SVJ1K5IXsaB4ZPtPqLSrfvdCIR3l4beTqsWSXVaPkP5FBmnNnOwO8Xr7qSqjwrOXNiPlp
	qqO5g/ZQoU5XzkSTG6uBmawdc7lz6KPE3tYoMa7PGL0nLB81r5BFeKxstu+5bnOVl08xt7MKnY4
	XkXh05LtKyjZX9jhgKDnfeMhe7Y5axdSeFI6FJkxt2lLjHAw88e6roKFhiVEUBFHBy53/r3r6WZ
	GcMY1Ao9+rKTOSrzXPCuSPHOtExwslqVdUJtnthAQBVtaGFHTVWXphP4Hg9QhFvBWK2fOqF2ib9
	XdIHti+rFJjvsD0JlMbPvbbho1eP8QHRUrY0Ng==
X-Received: by 2002:a17:90b:4ad0:b0:3ac:80de:44e8 with SMTP id 98e67ed59e1d1-3b41c933783mr1373568a91.43.1795143381867;
        Thu, 19 Nov 2026 18:56:21 -0800 (PST)
Received: from localhost.localdomain ([103.26.8.217])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm5546461a91.8.2026.11.19.18.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 18:56:21 -0800 (PST)
From: Lei Chen <lei.chen@smartx.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Chen <lei.chen@smartx.com>
Subject: [PATCH v2 4/5] scsi: megaraid_sas: Link tag set debugfs to the controller
Date: Fri, 20 Nov 2026 10:56:03 +0800
Message-ID: <ebe08c3f48026d81fe2af55d5ce8f4743d0c4a39.1795143228.git.lei.chen@smartx.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795143228.git.lei.chen@smartx.com>
References: <20261009030111.57784-1-lei.chen@smartx.com> <cover.1795143228.git.lei.chen@smartx.com>
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

The tag set debugfs directory lists the adapter's request queues, but
does not link to the adapter debugfs entries containing its RAID map.

Link the SCSI host tag set to the megaraid_sas/scsi_host<host-no>
debugfs directory after the Fusion adapter debugfs setup succeeds.
Remove the controller link before deleting the adapter directory.

Signed-off-by: Lei Chen <lei.chen@smartx.com>
---
 drivers/scsi/megaraid/megaraid_sas_debugfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/scsi/megaraid/megaraid_sas_debugfs.c b/drivers/scsi/megaraid/megaraid_sas_debugfs.c
index 81698cd83f5a..12c582e29ea4 100644
--- a/drivers/scsi/megaraid/megaraid_sas_debugfs.c
+++ b/drivers/scsi/megaraid/megaraid_sas_debugfs.c
@@ -150,6 +150,8 @@ megasas_setup_debugfs(struct megasas_instance *instance)
 			debugfs_remove(instance->debugfs_root);
 			return;
 		}
+		blk_mq_tagset_debugfs_link_controller(&instance->host->tag_set,
+						    instance->debugfs_root);
 	}
 
 }
@@ -160,6 +162,7 @@ megasas_setup_debugfs(struct megasas_instance *instance)
  */
 void megasas_destroy_debugfs(struct megasas_instance *instance)
 {
+	blk_mq_tagset_debugfs_unlink_controller(&instance->host->tag_set);
 	debugfs_remove_recursive(instance->debugfs_root);
 }
 
-- 
2.43.0

