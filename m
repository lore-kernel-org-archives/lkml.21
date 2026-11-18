Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998999;
	b=Elm8c92kOQ+/vtzy7S+KFJZbc44v0CxuUW0WhF3e+ju2xsqbprpmBbu/xEJM/ODLGm+m
	 S6q23plvFQSD04owir9Z6bJbqWZRmtBejWukJ6ZCX8ZGDXDm99pc5ttKZhZ+32LmBNYiD
	 p7f3VK9Z4Jn47+9jEwvyim0e7dx1NsirhOBS6fup+L8/sFP2uRO4ee9dG35QmgS1N6Tze
	 kSYAKPrwt8iNRQo+gLZPpEy9TFKGKZb2cGP345IiosmbEOyJfskDFP52Una2qLQ3dbr2U
	 BebwtcdIhQNL7cV4ZLGyitiF4uK+wSqL/K9zm9BCpcOMWYBl1qTcgaZailDDFaYlFBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fimuKL704+w6i+p1mK714enmZrR4sYS+1W8BVN4RDvI=;
	b=u4kFP4Vcroe+C3wMA8dx4YSWZNz7YD7JDv3TlsHbDqjFzQzezEThWhFqyisF848bO1B+
	 sXewwIzNThfOUQZWzQWqSQPSRksFrlaXIlg08uFQXXXrqaFdeO/3mxh3bKn/9+hToevpx
	 0sUO4iILYgEv2ekfViSz54MPMjhHAt44lzj6R92pMVxW46YemZRLxk7Gv8lvLmG5mp2re
	 pOV/Rj2HgVmKFFhE06fTRCJqk03Hh5SUIlhCQOS69WstmhsGypNyScmU9bXkWGpFwsCtE
	 BvkS39MjcvbXevhZI1YM2n+gL5U4X3iT2Gut+X5IPwZwkXffXtZfz9egaAub0AghHww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IKL+IduS;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD5B606A332
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DD5B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IKL+IduS
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38318d69173so199375eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998998; x=1795603798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fimuKL704+w6i+p1mK714enmZrR4sYS+1W8BVN4RDvI=;
        b=IKL+IduSHt8icXf7vsf/3N8oH0GRw551xT2y5OyDyRsDrs56U7awFNd8EZkpDthz1/
         eDRrSJnXP1k7vbjb8UsZrZpA+ffvyNwT+Tt3CCw8pZtgH0ygFYe0+48TSBouwgmTNp2Z
         slFGSTYqo5XuYigR9GvizeAJ6KuuDlAygGxEZvkq78xFTI4Pmbh7JpwQbC/twyJwRwvq
         e55U8Bq9S4ElelkYANd4q1J9Bez+nTvgItPm77Fe/vfv8fk419ChNyq8uM1wKc0N7K02
         ToHEJmbh5Zn+9h7HJV6DoNur+YgtCkU7boryD5EZuJLQvyH/Ul6frjivPmWr9EOgzKnH
         +PFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998998; x=1795603798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fimuKL704+w6i+p1mK714enmZrR4sYS+1W8BVN4RDvI=;
        b=P4SKbQA1fX2Y7hfChqTVafTbCl7BzwLI/OrqG9iUG3OE25Zdy3p2R1dzzlhPnkgsWP
         Alsn4yRKPobARD6jmG+iYSBy80sg05j9xpP39L6dNXfnzE6aDvkQfcj+9Gdnpovmvko8
         dHlN6F0sKzKHzfBzc5By7usyPvNMe0cD3bZQNOvBt0JGfY+UiwWdLzzgSzDOHBuQcKzQ
         QYWu1eUVDBDJlNTTzQWLnQe6VdjKPUJMowTikA+NGUlLRuHsOVkwgqqKy/QeSb6i3y5Z
         g/zTTIihVfZUH7wmX4ok5N06ynt7ci1Zkra5z8xBU5SMAvxqsepYz2aA8lpVylU+NOQ2
         cQQg==
X-Forwarded-Encrypted: i=1; AL+hErF39qBHL3ygWaAgeb2qqdpsv4wN37IteGFVaBjqxnIoNjnnBCTwHZ1bZfRsTtlrO6OBxPgLYZoxVEG8zAM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9Y0PxCRqD4t3ehSDpoVZRcQko8HBlblLHCpQiGAHS0qSwBDBZ
	nY/MR0ae5EzXm0JGb7tSJuda6ilPEuDzXaSTbQNUt3tdryTBZrfTB7vY
X-Gm-Gg: AZFdTZeKl8Lze7Odzn+9OFndiEC4ou2FiXwdWF30qzaNhMMUA8TzDHwcAlWyUATdeeK
	PX4pJkS15S8X0yLsy0AizBa/Kjd/nKrUna/0L2fV7Pgua7g3P3SszqITY3gdjV5YzMuNbCYYJlG
	Ls/uScBU/1LyffBcV++mqB1ozMRe1TG/0ccKHvcWUDvh6qxgK5QE5077R5CkP11z/LK10frKhgZ
	KVXnJD5mQmNGlLIytkUXidQ7KXDSG+RuHbDipzjfjYxdCSRxEMbAskH19tQtSjKYxI2SxnKyoOk
	848ga5gESTLhUViilemKyDwWyZ/2eKOnprDecEefxT6A+aa3Wsg7ZQSBHFBC+uBCXO4dgIaDnsX
	AsC/JYnldQMOWiTB12Ab9Sh0T27laFWbol5fbsJA/VAkjpNLj9GGdu6PLttp9PN6eIKeIiuZmAu
	zhghLIfh40aXmpn6VcHABWgP4cPhjkNRU9Pv+DxkLYTsn+elyGrFsMO7SJzMbIEZvFK3A7iS9bm
	EwwfNmOWu2QBnfmjz7Q/aud/1+B+ovAdVv5pnxJSTS/DPpOt7rWxj0wTM4QuBqLFeZH1DeNotUh
	JIRc8RaQTlPHUyBvyKobymUn3uxivH4S
X-Received: by 2002:a05:7300:d088:b0:381:a911:1772 with SMTP id 5a478bee46e88-38281215ba2mr2333979eec.22.1794998998227;
        Wed, 18 Nov 2026 02:49:58 -0800 (PST)
Received: from archl-rock5b ([45.112.0.182])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45260a8sm11729913eec.3.2026.11.18.02.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:49:56 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-pm@vger.kernel.org (open list:SYSTEM RESET/SHUTDOWN DRIVERS),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v2 2/3] riscv: sbi: Register SRST handlers with firmware priority
Date: Wed, 18 Nov 2026 16:19:14 +0530
Message-ID: <20261118104935.1716-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118104935.1716-1-linux.amoon@gmail.com>
References: <20261118104935.1716-1-linux.amoon@gmail.com>
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

The SBI System Reset (SRST) extension currently registers its poweroff
handler using register_platform_power_off(), which assigns it a lower
priority than the default PMIC poweroff handlers.

On platforms where OpenSBI handles system poweroff, a PMIC handler may
run first and perform I2C-backed regmap operations in atomic context,
triggering invalid wait context and scheduling-while-atomic warnings.

Register both SBI SRST restart and poweroff handlers using
register_sys_off_handler() with SYS_OFF_PRIO_FIRMWARE. This gives firmware
handlers precedence over default-priority PMIC handlers and avoids
board-specific workarounds in individual PMIC drivers.

Defer handler registration to a device initcall because sbi_init() runs
during early architecture initialization, before dynamic memory
allocation required by register_sys_off_handler() is available.

Preserve warm and cold reboot selection, retain the existing legacy
poweroff fallback, and report handler registration failures.

Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Suggested-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
New patch:
   Link: https://lore.kernel.org/all/20261110061429.2036-2-linux.amoon@gmail.com/
---
 arch/riscv/kernel/sbi.c | 43 +++++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index af1ccea222f1..ab6e5bf25411 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -512,23 +512,50 @@ static void sbi_srst_reset(unsigned long type, unsigned long reason)
 		__func__, type, reason);
 }
 
-static int sbi_srst_reboot(struct notifier_block *this,
-			   unsigned long mode, void *cmd)
+static int sbi_srst_reboot(struct sys_off_data *data)
 {
-	sbi_srst_reset((mode == REBOOT_WARM || mode == REBOOT_SOFT) ?
+	sbi_srst_reset((reboot_mode == REBOOT_WARM ||
+			reboot_mode == REBOOT_SOFT) ?
 		       SBI_SRST_RESET_TYPE_WARM_REBOOT :
 		       SBI_SRST_RESET_TYPE_COLD_REBOOT,
 		       SBI_SRST_RESET_REASON_NONE);
+
 	return NOTIFY_DONE;
 }
 
-static struct notifier_block sbi_srst_reboot_nb;
-
-static void sbi_srst_power_off(void)
+static int sbi_srst_power_off(struct sys_off_data *data)
 {
 	sbi_srst_reset(SBI_SRST_RESET_TYPE_SHUTDOWN,
 		       SBI_SRST_RESET_REASON_NONE);
+
+	return NOTIFY_DONE;
+}
+
+static int __init sbi_srst_sys_off_init(void)
+{
+	struct sys_off_handler *handler;
+
+	if (sbi_spec_version < sbi_mk_version(0, 3) ||
+	    !sbi_probe_extension(SBI_EXT_SRST))
+		return 0;
+
+	handler = register_sys_off_handler(SYS_OFF_MODE_RESTART,
+					   SYS_OFF_PRIO_FIRMWARE,
+					   sbi_srst_reboot, NULL);
+	if (IS_ERR(handler))
+		pr_warn("Failed to register SBI SRST restart handler: %ld\n",
+			PTR_ERR(handler));
+
+	handler = register_sys_off_handler(SYS_OFF_MODE_POWER_OFF,
+					   SYS_OFF_PRIO_FIRMWARE,
+					   sbi_srst_power_off, NULL);
+	if (IS_ERR(handler))
+		pr_warn("Failed to register SBI SRST poweroff handler: %ld\n",
+			PTR_ERR(handler));
+
+	return 0;
 }
+device_initcall(sbi_srst_sys_off_init);
 
 /**
  * sbi_probe_extension() - Check if an SBI extension ID is supported or not.
@@ -677,11 +704,7 @@ void __init sbi_init(void)
 		if (sbi_spec_version >= sbi_mk_version(0, 3) &&
 		    sbi_probe_extension(SBI_EXT_SRST)) {
 			pr_info("SBI SRST extension detected\n");
-			register_platform_power_off(sbi_srst_power_off);
 			srst_power_off = true;
-			sbi_srst_reboot_nb.notifier_call = sbi_srst_reboot;
-			sbi_srst_reboot_nb.priority = 192;
-			register_restart_handler(&sbi_srst_reboot_nb);
 		}
 		if (sbi_spec_version >= sbi_mk_version(2, 0) &&
 		    sbi_probe_extension(SBI_EXT_DBCN) > 0) {
-- 
2.56.0

