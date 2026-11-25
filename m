Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795623020;
	b=AG3BwXklZjI3Ut71aF5jyQfpn7/rakWHrihIDwvbZso7zhcNgoDmvnkaCNYhkIUzqDY4
	 2pgiTRdoTVwW5s6+AbsSwn/PF9caB0oKWezbgBlXsdpsbShqEG/Q+kJtIm4mUAkYkJsVs
	 xRf1dofLHL0s00fVlIE7KYHKBuEhQciQJ/RsXydDmjcb7U62N730Qd03vmNQ7NP6KfPi1
	 ZltrkYs3GOinJrAI1ooDF0MJG26c5oqxZ2EnpQneL2OGLWC5XQ5Vfp8B22KQb0uIE8Y0L
	 j2iYIOwUkebn0rn4z5GECWyM6+bJmZAvv0ppcuihwmy1MtvWk3ebEn20dZAb+2bBVGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Yu4ougEj/Ep72fcpNBcXogN1OvBzPZQsjitN8cqwc5o=;
	b=Qt3a4YVfwcyZ6VjbaOrGcwGI2l7QMmMYUIn190TJQFjrfNFhAAnPPuJO49TzozkW+d9V
	 KvihOtMnpGWrjFFIsgcFVF6fTfoUhaXlWaMTHm5WGZuXgEwtX8P1tffZnUmCspIYzSj4c
	 loZc0cjk70y35VifO3+ZJwJx+KQSmuhYGF2zmId/iji47nHkhJ2kDEFTMv8XPETvW3j8T
	 JC4Fec/ica+IIhB4jcCv2QT2sLo/lvGOheYjaPRwEzT/Lf/aD4YCfn+DqvepNtkOJLtK1
	 JZWS5I449uR9oj83ss1WcXxYloVALnk1rvOjfuVxBrdmoydNSqWcsi6NGy0waFYbRsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uaDoZZzt;
	arc=none smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDE3606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EDE3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uaDoZZzt
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-677bc4704cbso7101219d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795623018; x=1796227818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yu4ougEj/Ep72fcpNBcXogN1OvBzPZQsjitN8cqwc5o=;
        b=uaDoZZztDrUPOP2qNMy5PAa++OCYDKHx9wU2snbN35Ewqdp7Ow5UsWexXVDC2ivM4Y
         flyPYI4NBCYrVTdxQKt+aDbkYnlYZxI7FRLUoDWTLAx89vLMdI/2hCIkWyhvb6Co0qvA
         05a47VAX063Uej55XX5ourl+iEzrNtsZzyYpLGrR+RNpmCgb3oA0XtYSOCZRNpXuytB8
         Eg1eQrWsWnmU08eRLeSGe7hS/Uek4xk4YkO17Qnn3ITee63BaEOYpzZocVftoX0qf0P0
         eKSEYc3u3iSZ2xsrCKX32Ecg0KEqcgXR+SfM5uDToCDyEksZ1aW2r4x9m7cKZZ7pshdc
         ptaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795623018; x=1796227818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yu4ougEj/Ep72fcpNBcXogN1OvBzPZQsjitN8cqwc5o=;
        b=gy9f2RLAlTo9V+1afVqBQfID7oDYZyqD5+yVVEvyv3X7Iv/Y5urKto4JUzfL+tV3NT
         NvdGhBA2zq4pa2Dx8RWQKrxpK+xw8/Bmge9dltvaZT2uPoWjfQDER3W1lhlxS1eu14PE
         mvuy2ch/Wbr2pAX8rqGTJBIS2aseu8c25aKUB565n5FkLU927vQUoq50Rp9AkNLccVDw
         910IkCV+VIX64BZtG0QoxxCwNSSJTn97TzliJGQxzX6j5GHN0RbEuCinXxFny2kMflvm
         EhBMBnoOoFzE23kLCYH3sDugS8Xye9zQDHmeOrGc4nMILhblxGSQpXAvk6jGA7IAxfWQ
         nX5w==
X-Forwarded-Encrypted: i=1; AL+hErHSk23beFMr6w9umZneC6Kp1QEtAAuQlVNcHcdkUlYjHse54WSbSaAGgV8xlayAcrHNEKipaa7+0iK9jBo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9d6R+BbrA69AZuyRvy1gbZJ7oAv6qW3NSF31Bz7ccoEOMRxAa7
	wtNtLGEheYED2mbAo7WdlldYrKAthy5jUzat+p2JW3g55zGrMywe/iU=
X-Gm-Gg: AZFdTZfW5/fmbKyA1jyTEkUS42lLIo5sqXGf+mA6UoCiia7LulhgX63Uxu5W9bdCPJd
	Xy1/bLOfdU6lLB5tK/lrRvBPxblI54PT3XTONxXrAn5N42JVmAbXu52YwGcYC+YxowIqMawdkyi
	ZAH3X+5Qmsnx+mbyzrWYHjNdmjyGe4tFCilmOrwLcWxL0OQXlIh3w9OBp69VSbl6vYZtZBuym4c
	eYRN3HAnqeIHJ7+AvP9219pHo3+L7fa2UJzx7VbWjx+L2byVu4LIIgT4WRw9qGkn45GrJXc8LWS
	Ofqer2mnRSxPmpdXpdVyxKQwOioj39CNs3rQUngH2CqLw22Gk1cjrS1mU78nEuAsdzukUAOv9kh
	V6q/vUDGGvKB3pLjp/ty0x8tJd1e+hkXOdQ8LELa1URvmligd6Y29YmroaL2Xz8yDYBaNBubxJs
	4oIbUdZwgKjptRyAopYnlsBAx5LQmwF+PJSoGMIinSPlDpfLcw8GfSVuQseqVQjvQsLED0hBBjK
	EbQXgA/hlF9SiwcYRf2lMNfxg86Lj6zXhYLwpbh69E/qQSCxBJuwNYl/aBqpIuVTij5bHGN/+AI
	wWeeUoX9xXvUdzAAZm75Oa0S5dCOq5L0flc=
X-Received: by 2002:a05:690e:1c08:b0:67d:a95a:8e1a with SMTP id 956f58d0204a3-67df44273aamr6039215d50.71.1795623018097;
        Wed, 25 Nov 2026 08:10:18 -0800 (PST)
Received: from 3511.attlocal.net ([2600:1702:7a3e:17b0::c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df3354415sm8960040d50.11.2026.11.25.08.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:10:17 -0800 (PST)
From: Arav Verma <svav2021@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arav Verma <svav2021@gmail.com>
Subject: [PATCH 2/2] MAINTAINERS: Add myself as maintainer of Intel WMI SBL driver
Date: Wed, 25 Nov 2026 10:10:16 -0600
Message-ID: <20261125161016.781273-2-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125161016.781273-1-svav2021@gmail.com>
References: <20261125161016.781273-1-svav2021@gmail.com>
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

Add myself as maintainer of the Intel WMI SBL firmware update driver.
I have contributed to it recently and, because it is currently
orphaned, I would like to help maintain it.

Signed-off-by: Arav Verma <svav2021@gmail.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 18c0428913b2d..03ea1ee0a8360 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13887,8 +13887,9 @@ T:	git git://linuxtv.org/media.git
 F:	drivers/media/pci/intel/ivsc/
 
 INTEL WMI SLIM BOOTLOADER (SBL) FIRMWARE UPDATE DRIVER
+M:	Arav Verma <svav2021@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
-S:	Orphan
+S:	Maintained
 W:	https://slimbootloader.github.io/security/firmware-update.html
 F:	Documentation/ABI/testing/sysfs-platform-intel-wmi-sbl-fw-update
 F:	drivers/platform/x86/intel/wmi/sbl-fw-update.c
-- 
2.47.3

