Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795650016;
	b=AUQuG/teKFswnYnQeWrq0+uxGrkUQ4PoptZzQZHKoXbRlw96fqiC5mEzt+X+BXm1ABr3
	 9kJKH0mM+UiVjE5qT10Bn+PThlITT9nWQe4I+ydCpHYKFrxOf5BgljKLQfhYSh2M/CAVS
	 5qlfcl/IW0BsG4+g/6yABRU9UxcwOjvXud76RPh8y3DrSlTOWU/ab2yF6D+ae74lsqvgn
	 5UgNxxCwBksWpuRYVOWWT9llAO5cgZellGatySBrsPLHKYjkHfE1AsF60q/phSP8PPeL/
	 jt1Dx3GfLx5QoifAFRwv8SuPzXm19KDl5Tuwv6m7TbjCYQZCiksHgOIleGC4ZorkyLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795650016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sy32AM7OWNp5QprjDSdpmB7KMgeEhH1/PrZNTOpYGSI=;
	b=DnnnKs5y1mR6fT1Q52Pn1qOrj4VYq99od4YCRk1UCd/mLs/zvmcLcZiZVzYjndrmDgBk
	 vYcGBK7wCnFHqAM2wPWkc82DKNSYigWHaqsfbWb5npU6mYz8CjvQ+ufRp5AA2RY8JRcaX
	 NvyuDvGkrCxyZqfLPOeUkJ8Djd9oQEqytI6TlnDuXpHFPUaJxlNthrlsY9XYkkxvJwuNT
	 y4iGelo2Pz2Yhd0MhfRQq1NxgXUh2kWFLCCQ2Bnd/3TdeTkCPDk6ELKWoWcOHofnDWVf/
	 MlYLWjsFIYRpmstytP0W07AV8643/4nYq2WzADzx6mdgxoOEDigA9KxvFHPnNdzmdpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eV7s7p48;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDE0606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DDE0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eV7s7p48
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bba5e17cbeso12101615e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795650013; x=1796254813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sy32AM7OWNp5QprjDSdpmB7KMgeEhH1/PrZNTOpYGSI=;
        b=eV7s7p48l0yWT+W7zLISJg0zwgqnRnYXAqaouqk6QzCcqvsKi6IQ6gvBcuKe3y3jEI
         U/gO/KkZKX7nPeIDHZhOmTYGTD8oQruIjejDeGJQDxIyARVwAQrCs/FnHVm/sGmmAtP0
         eFX5dWz7uBGLNOCvmKgWyCM2ClO6v7WccN92uBSdDZcJB9ka0iSXLL7CtikujSwRHEp2
         cIY/0zTCEpoqeUS5HCT4arF4+dbh4Cq4eUJep6GFwOXmg5ISC/0x7dIwRlH84RzMRLWv
         23zuRHDaokVfMqMEM4A4RU+IRaSC+ZeWVJGT4/7ym+U1LtsT87BzsfTP+WdFov4UYMZY
         8lbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795650013; x=1796254813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sy32AM7OWNp5QprjDSdpmB7KMgeEhH1/PrZNTOpYGSI=;
        b=pkl+YrpOR44spG6kl91YrB7M7Q1INi8F7vyq5omCevfMLvrFu4nK8qanbtCMDPW5/j
         ykN0g5rHDWZeGvBJyBES69GH8zyblWtCHv3Y5kwZ0S08eAJUfChcB5ieFqFOu7+aubIi
         9IWTLAwN3Zyp/35vi2tDb+g50D9tJQZsIgB6dGXJeAUIJd6Ed3HubCsPR52hPBe36vzR
         xAMlV6uz1d6cKHLZieb+9jasAc3KurcQhy1jpmr4UYgsVnHd/ICzfMtRgirXG4fb4mjd
         g9B2xMjkn0XKgQYSZWDCH92w4d1wmlRfjghJBwp5kvv8OVoB3MovoF8+D6cm0RVmkyeY
         fJOQ==
X-Forwarded-Encrypted: i=1; AL+hErHX7BgzvaIocT6r680f/uqyaisAkmjyPXE3+BmcwI2FEIgBkvMdwuORgVfawDqBymvWpQElDsIsCjzG/P4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BM+sdXTE7b3LM6AGkFBse5jARkmEn8NQKL9lUqGIWVbkfmZ1H
	Re6JkvSfa7T9Zs71OwUD0g5cOtfWhs/feuYd6wl89Vg70GNkMjbHDv3S
X-Gm-Gg: AZFdTZe2ZV+trTMA7rP5phJ82Lj0DBU+u1hDAHpKv3Pl6XynQweS6iZGZHWJJcFlswR
	ZBUOxSS+sr4k08jc8xVnjjjvTrTG5TQwhGjIG0JyHsGndqNeYwhDOGCW+L6s5JPmkrfu/CTkmS7
	+xqQA43NNI7XkBAVaVwofASQrW8Ou5OmLuNgK/qqwM8P3U6gsSvMCoZPDV1uEFFuqtTJ2xB9YJa
	/KlTQA2YOg4wxTJQS8qnfesZAfReJNP+TdGdql7kkQtM1WA1qTnmB3dmcMtsMA4+7JKLVqvPK/r
	j0xcXrOiAEp0eR5/nsQd4EU90dbhiPQOOz682zRESyRgzvTyYRSnm77jAsWzhtFvJa4CwPEdQg5
	5Bf206fDm5uHaGamuhJuFb0MG3Ko48EkCalFRAJA5pXCnB4LMrJxWhS1hp5YkOlUwoRqF24gjwz
	mmMamFtuEGEg6/RPLbOdt9g+pA1AJ9FSCKqkkVoluPwyE96gDb0o6En+Sf27K0ReJjsC+vdmo+e
	q/kE81qreUfM8XJdn8uhesHU1ZYCU4aCdOFtsp3NyA2+cZNxfRTtkWdHDoQWckH6G9sJJCIU4/h
	TSozUdgbMl6UKyU+l9DVL6Dj6Z6Pcdu/2Lw0UDE8GhAberEqLtfFPzX7cCbPXL75mBcenIYpNqC
	5+emC/+d1VG3Lcno3Bx/WYMoyTvlbKaJR+dRXrLIcALcuKgF+tAfM4nJ3yrUM9qkD96wP1OI7vn
	dJtMycyxbHBGUo/RZw9+Tbu6dWf3J3JnBmkKpst/6pjIQ5VOtj2zXAqWrAk3dKFRdRqa9kSQ6PX
	fAH7Aa119RqoBrl28n43dnzqYTaibC67DTtT04=
X-Received: by 2002:a05:600c:1d09:b0:4bb:6fd3:5ac0 with SMTP id 5b1f17b1804b1-4bb88816c7emr423168995e9.28.1795650013339;
        Wed, 25 Nov 2026 15:40:13 -0800 (PST)
Received: from longitude (2a02-8434-fda5-4201-e77f-3dca-f235-969c.rev.sfr.net. [2a02:8434:fda5:4201:e77f:3dca:f235:969c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm42466849f8f.24.2026.11.25.15.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:40:12 -0800 (PST)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tools/bootconfig: Reject extra positional operands
Date: Thu, 26 Nov 2026 00:40:04 +0100
Message-ID: <6e1358cefd6ed85c1c264cfbe195b913a8a0aca1.1795650002.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The bootconfig CLI accepts one input path but only checks whether a path
is missing. Commands with several operands act on the first one and can
report successful completion. For example, bootconfig -d first.img
second.img removes bootconfig from only the first image and exits zero.

Reject surplus operands before calling the command handler. Add tests
for list, apply and delete with an extra path.

Fixes: 950313ebf79c ("tools: bootconfig: Add bootconfig command")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
Hi Masami,

I ran into this while checking how the tool handles more than one input
path. An extra argument was easy to miss because the command still
succeeded. I added cases for list, apply and delete and ran the full
bootconfig CLI suite on my Ubuntu machine.

Thanks,
Eduardo

 tools/bootconfig/main.c             | 5 +++++
 tools/bootconfig/test-bootconfig.sh | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/tools/bootconfig/main.c b/tools/bootconfig/main.c
index c85e58fcb6b0b7..3e56a618fe3a58 100644
--- a/tools/bootconfig/main.c
+++ b/tools/bootconfig/main.c
@@ -592,6 +592,11 @@ int main(int argc, char **argv)
 		return usage();
 	}
 
+	if (argc - optind > 1) {
+		pr_err("Error: Specify only one input path.\n");
+		return usage();
+	}
+
 	path = argv[optind];
 
 	if (apply)
diff --git a/tools/bootconfig/test-bootconfig.sh b/tools/bootconfig/test-bootconfig.sh
index a93a40d11d278f..ac0ffeffe1f7ce 100755
--- a/tools/bootconfig/test-bootconfig.sh
+++ b/tools/bootconfig/test-bootconfig.sh
@@ -71,6 +71,11 @@ xpass $BOOTCONF -a $TEMPCONF $INITRD
 echo "File size check"
 xpass test $new_size -eq $(wc -c < $INITRD)
 
+echo "Reject an extra positional path"
+xfail $BOOTCONF -l $INITRD $OUTFILE
+xfail $BOOTCONF -a $TEMPCONF $INITRD $OUTFILE
+xfail $BOOTCONF -d $INITRD $OUTFILE
+
 echo "Delete command check"
 xpass $BOOTCONF -d $INITRD
 

base-commit: 56bb11fe6aacc7666938e8e6765b44aa0cf1fcdd
-- 
2.53.0

