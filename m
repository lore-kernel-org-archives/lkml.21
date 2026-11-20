Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205386;
	b=LSJzg5LDEQGTlXGB68PyBRF9jlF06wVknahtwJvV4wSI5x8t9ghxH8JxlHNiX+ifRzci
	 KzJIot3dZ3QoAFED9PkQFIBP/B2G3pA7zqxgCSk3gF4iBt8UmoY8/GZ2IRgqro5aFUdoN
	 UnFf/y+fagX6Oy3xAKGyrDzWjbirMa+93d1Yo7ljIamx94n0axgJFFzsTIm6YPL7npZgN
	 4CxQGy4qgHkY/XNS9baHvexK3qGN8DqNNHXk4CoNJUFj4tjv6ZYHMDXI5ufu0omknQOg5
	 eCzAZWCs9RJT3VOvJIDwSDg9SQifcz2jKaA5eKBED/1gr/Gx8XtGE9XjifnbQxTWyxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0vblFSre3MiOJ1U1d0ar++bbAIQ+Yx+HItU4giCjIDQ=;
	b=bLVx+PTvqZBUUUUYtQNpnufRH/RH0l5KqC+WvLGLd2A1P5/azgmF9tasySmaF/51QkMf
	 nymXF97IuO6YfrZiYX+G0b1Syf8om6pSZJF8FAWj2PKY4+tuppKW+6WT1YSIZn0eSZ0t1
	 bbU+/S6yq8wDuQsaBtjPXkD2745g+7WYMwWXLfeLot+iyvzRlTk8kvD3d+KZDvN7YJhEq
	 xPkT2x5Z+PAjly9tUCF2+MUUF8yiFhMdk0P0O3TLG8hxdKl6Xs01cnwntV+O97KJR/SJE
	 uuq454Jaj5rC15oKqOk4N53AZgS+dait18psSxMAyIFwIKNl0cYimDOS319yFd178kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nQNKJgNb;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A329B606A6C9
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A329B606A6C9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nQNKJgNb
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so1091802f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205377; x=1795810177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0vblFSre3MiOJ1U1d0ar++bbAIQ+Yx+HItU4giCjIDQ=;
        b=nQNKJgNbi5WNjZLZZ3ynpZRwNGTPUS+Yun1AMIQCdwkIKF3lX27zriptMSbfAF7hmz
         ESMHhJhtMC1dKOVASGJJfPza4MLeQkPDvM/Ql6gx0eD8vK9MwdmMkeqi5LNyc6Fej6CU
         FZLXCcSvBkQHGmgF8npPM4EoRJ7Skri59uaQUk496pncWdmoNd4JaDEFdRQPl7eKPDQi
         rpPGRGJpWUQ5YUSJrGCjlXBy60GCHXpwpPMpWM05jEWsF2I1z2caCpKIkFx6Vobjx57/
         AvdykvH1NSZ/2HP3/m3VthTpvU/yrREdUcEY4xV7t/Pcq0m2QwAmMosE1jG/42fFs6w9
         qffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205377; x=1795810177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0vblFSre3MiOJ1U1d0ar++bbAIQ+Yx+HItU4giCjIDQ=;
        b=NJCEjIYecL+p7rZ4ph+4eT8K10XJ54mzGX7CATWJzybn3aQtQkD+vTHAbO++xwirrB
         CUgF5X8SluDWUJLNYm2LM65vr/FucMHPlYXhPiaYwxdHMiSr7+Th36Zztc6tFHIMzFhZ
         waqDa+K9d24aI94O5NK2avaVB/yaj19FsNdUY5aTqXO7IrAuU63V1BQoRSxLLPMxwbXW
         pfT/UaTNZynS6KgLmG8EMSGfh+oODrYa+dq8U7jbDwU15F8+9EaO49HdklPvEJDUS71f
         DoqSEXmmdiaXsu4Q2ZOIEH4u8oNuoFggN7f9NlNh2R95mEAZx+r1mIsVM+xeJW/CZcg6
         CntA==
X-Forwarded-Encrypted: i=1; AL+hErEUpm/iWuLAPLgIqQiHmoOPIbDo8Fx5QQSiYrx+LefS3ueVX70qqwtKc2f2BKP0FLeFlCxw+H6k6rdMzKs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pm19EW9jG8oO9EUqA7f170/gS1bl4bKk0qec/VVyT5/XE3Okh
	JkB22uKID165lASZed8HDGxj5+z1VR4zPOVnJPeo0z0iEMfSEh+Ow1Ev
X-Gm-Gg: AZFdTZeQlpHEwBICFxNmN/eAASsM8E/g1QuczS1fy+m66WocvW6OJEdJ5DING7VljFw
	FAD0SPYCuFjf8vI2yLi9dkmDAI9D/qUYdDhUGApI3/SRWH44nOM4xbLPzuwkqV6SAl3VLAtKNj3
	wcBj3wiv4OGUI5xm47wWdCLjHjBvlYTQifozjgjMu03o/yE88PN3APThtOkWA8uRWEkGwlVn7DO
	larfuu2ob4e/ILKrNqoQMFmzdr8ukjBp/JPKnD3dNpGt7V2B5UHjPyjTxIMF3UzWzww5ej0NgYb
	hwsYbGKdUi1Blc14vO4v4/Nnq45WEmBH51XJ9N5J0cjr4xbadL3sYQ9ai5dm3vNQ1eycELT7/9y
	IkBbqFHd3ctggZAjoDB18oMt8DivGtllDvdFaODlxL0XL6fo8KcfL36+/kfRQ7FpnNR2bv2gZ+q
	WekLGba4uPOcJzRMn906FOBOoDyIzm0PphOd7sB5euVutqYd0+GAlYIME4SNhvMjhRN4oG9MQuZ
	e1u2Uyw1nHMJF9NA0+S/tRmYiQ0YCBKF+C0Kfamlviz+pFqGW93nu347hiZcxu38CZL+oIR76aJ
	pevVmrPcCXk/K0Pfw5TFzHZWkpjIhDob3l1vlMSaJYbedQHIozk=
X-Received: by 2002:a5d:5d03:0:b0:492:cd78:7137 with SMTP id ffacd0b85a97d-4abaa9764d3mr9017536f8f.8.1795205376952;
        Fri, 20 Nov 2026 12:09:36 -0800 (PST)
Received: from vivobook-s16.fritz.box ([2a02:908:e843:f280:6cae:291b:a1:8362])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm7869233f8f.33.2026.11.20.12.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:09:36 -0800 (PST)
From: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
Subject: [PATCH] wifi: ath11k: use the NFA765 firmware on the ASUS Vivobook S16 S3607QA
Date: Fri, 20 Nov 2026 21:09:34 +0100
Message-ID: <20261120200940.81577-1-ingo.kubbilun@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The ASUS Vivobook S 16 S3607QA carries a WCN6855 hw2.1 NFA765 module
(Windows board data: bdwlan_wcn685x_2p1_nfa765a_AS_SA_S3607QA.elf).
With the default WCN6855 hw2.1 firmware the target crashes right after
the board data download; the NFA765 build from linux-firmware
(ath11k/WCN6855/hw2.1/nfa765/) works.

Add the machine to the usecase firmware table, replacing the deprecated
firmware-name property in the device tree.

Developed with the help of an AI coding assistant (Anthropic Claude),
which drafted the changes from the Windows ACPI tables, existing device
trees and test logs; reviewed, built and tested on the device by the
submitter.

Signed-off-by: Ingo A. Kubbilun <ingo.kubbilun@gmail.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 766ae27306f4..37e443a18d31 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1049,6 +1049,7 @@ static const struct __ath11k_core_usecase_firmware_table {
 	const char *compatible;
 	const char *firmware_name;
 } ath11k_core_usecase_firmware_table[] = {
+	{ ATH11K_HW_WCN6855_HW21, "asus,vivobook-s16-s3607qa", "nfa765"},
 	{ ATH11K_HW_WCN6855_HW21, "qcom,hamoa-iot-evk", "nfa765"},
 	{ ATH11K_HW_WCN6855_HW21, "qcom,lemans-evk", "nfa765"},
 	{ ATH11K_HW_WCN6855_HW21, "qcom,monaco-evk", "nfa765"},

base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
prerequisite-patch-id: ae6c33cce4db2472b5aa360b5e6cbf29763cfd69
prerequisite-patch-id: 85373c0c0ff98ec4cda496c612feffd19f715d52
prerequisite-patch-id: d752bf7c6f8768fa3d4d39387455c3d4551a8481
prerequisite-patch-id: 56220a324770319f2420a2b114db8fd8c0c6b7e9
prerequisite-patch-id: 78692cb7c49dbb17552ec082f147c878aaf38761
-- 
2.47.3

