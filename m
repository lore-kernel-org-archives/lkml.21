Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795771720;
	b=Mk8i5NIa8NziAC3HMFN2k01fyt5dA7fgcs8nqHQhmn1ScGnF0Pa9anhhDo/qy3LHQvYF
	 EmGTnmIL56I71onJJLWzGayVZSj3xa5W6/suMSOeTJXYrS7SBTz4W/9E9nNEfH+ptKpbA
	 uBbSw7VrOxXnC99735V6LMnU8VdWoO2jQkg1jyx6x0rQ8YP4+B6k4rw3lRWIqsZ0I9nvT
	 K1BG2OI4GZZf5M+l5xyOZqzD+XdaNxDOKMA7UfD2UTCiIMbhOzFdIt5DSketr8XCduL+U
	 iCr8b9gHLYTrD+wPPVfwbFQaly7BRqsX126dh7QlZBriAPmMw7mT5wwm6MV3SHEeYyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=jasLtAoAN2ehO2HUA2d9AgFolPUIbV0VilFvPbWCDQI=;
	b=kJh3weWoaq3o711mthVDdcFkgTp7YTcWDAHonM7kZ0ib7snOd5tarhhcif0oPz7QUwCC
	 e01ti0JqWTdXsoMV7is0iJ94kH5mHBtK8QST1M7YEbkcV6zFi7SRF9hqblxV3P8AZc9tT
	 A7+3JOxIVPJDpOi5cQaaE5ZDWEwjB7+spYlICNZ4ShxR+u+nN/ykMIFONDu4RXJpPc1Pt
	 ySj6zg51SJTjJ8c+n7O5d7fiRys+CWhieguRWNzMoyyZCYIlogkk5QDEsl5vPk0KN2ad5
	 TVPfltBMMny8EUyCRZmjNvas1wLjvO469E0YFku3lM1TQElULV+c2MaQ805ecNSWUOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rh16fdah;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CB5606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84CB5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rh16fdah
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-71b30ed75a1so4485660eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:28:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795771719; cv=none;
        d=google.com; s=arc-20260327;
        b=HXGeulJ5bJcYBRGEd7qd1jML2toof5rGct5VKWNEg8sLFwsxWl+BNef30qsfaAQm6e
         jR8HMbOQ9SZfiTgtrhvAqDIHJRvWsc5Z+cr5dEKUOdQIPm7yeNVx7i6C90SzeNc42gQT
         I+RzSo8JV2F2tPXlVIIcnHwRoPRc2NRKTKhQu4f9fXeYxIhdVphap9u6dyWwLYzDLGPl
         EQiG4n09RNLoLS1XKerlUzhtlfO18MuTF9eyu1qkTWV4/E5EbRaPKb5U89ygcv4ZIvu8
         oDTRastaZyQJOAFe0cs2snn5DABBiNiZHEZ5ejT/0eJTwqOQfrjuEZG8oI8Qt4Xef8GW
         w9NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=jasLtAoAN2ehO2HUA2d9AgFolPUIbV0VilFvPbWCDQI=;
        fh=RKw2iBXXh1Q+hv8B/ukbCBgONDDQkppTuLIvwPV2mGw=;
        b=aYe5FpeiGCRT0teVvWN+AcxRVLVpITsnlXNeJ8M8Ml3xb/e38dKXDWvzOt81rgNPx9
         sAtVv8YBSIcn0si4hB+TOgt5mdvUxdf/Qck32wZs3YbJ41777fBpK9AnVVirqLnIoJD5
         oZ9SQxnXpw1V6dmBgLtPUBF/d150AitxVL8mFydFOEl1aU7qPC3NGWkNdbY3fF+Q2L2t
         JDKJh6K//I77Hi6OAghmBN16SA093nIR/n+dNVwkVttgR20f/hp2zCIQDTE5BzgPoBFO
         Q4JM8rRj+i8qMUGN+AYatWDbIj+o64m4EYwU523os6Mo9b8tEW2nC8GQOPSSNTdfAJYl
         gjig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795771719; x=1796376519; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jasLtAoAN2ehO2HUA2d9AgFolPUIbV0VilFvPbWCDQI=;
        b=Rh16fdahTkQEr2yvVBRJtwyGnSAEFnpmKRuEY4VXO7nsw7zB+ex9qefDx7s0fup7eE
         HfvsT2dDX0gNl3efQY+ztdmRkgDrArOtyNy69FzG+zJGk0KYKOuRWHnJux4l7w1UQs1V
         QQjjBGJPIfb0rn0PQop3avMkjA1j7sSSJ75oGJUS9ur0qpazQ1PyPXv+GrO8iVGds8OO
         8qXtqT34EW3BOo5kmmYx9Z5JuRDIoUY/g7i6q8HXBXnftNXfZo9zQ4kz6Y1LgivYUgUe
         hSixs2u7lgRAWet52bWJjfOHbqaIeieewDhqyDBPZYng4Rk5uzrebQ5B5rhSddKBuyfL
         Psxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771719; x=1796376519;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jasLtAoAN2ehO2HUA2d9AgFolPUIbV0VilFvPbWCDQI=;
        b=UyqDbgOU2oTm8mqw9QNT5chBCYz7CTUycj4fqUo8IvXdvSIugdKqf1jD7BXaPLB6uV
         Djtr4fGRDH9PCFbelEVM1S7n7hxgxBsn29Kz28OaJ69SmuHOXSNsgaKVi4MXMZd8+aiU
         1x0G3Q01tvhh22OL8/U8rOeHFzPfigBX/cOhyKGN7AnnInrpaktU3wWfxEAF+bu6J4zl
         cLBv6KLga6hnM88D5ABfmwhrpFiSLqR0Cyx/WX1LmYgsh/iMhlplQSTQXQBNyLf6lzlW
         8zfP/oOPbv6Rcr002CGplBWGCgNAT9pRlmC9/ugu31ar3t8bYWmipc+GlhrnZGe9Vxd3
         wZDw==
X-Forwarded-Encrypted: i=1; AL+hErEBZiG7E7bm5wEfrJIf+iTWeP6L1341i39ONNEl4kcEJlgZiEZNWSAEJ2vR+VXjTJgYTnZvaYwbYLScWPM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8p2EFnOKcRgbLtQcmhIDugPMKhu1yIgfJUTJ7ANuwDlll7zF6x
	AZaIwHDCrkPcQGCXMk4aBYl3xFPOZRJfrbeIAKin/IG1Q5jQQ+eRUh0CB6zB0i7hYoOqSjnZD+h
	spr0EToFhaV1ZA9zUFFw+3nvowfm0HII=
X-Gm-Gg: AZFdTZdkrjfLL6qzghp+w/wJeIYiCHSp77t3XhHb/oPoVl9m4DSQt+51iL1eOszFs5m
	C6FSdDc6jq4xHShE+Jr5DH1jxDG9cLmxf2ClNdI0h70pk18DhIBQj/8KIm0g/mOWXRJHmFoUlct
	FyjlgLFyXh2NmYsWFs51sA7BUCGfisz0KxjyK6Wqv+PwDKgIna/83QU3WCauNDcVKjELhD72yIb
	HWNMRhHC4UXPOcwScMshMnZW+T02e3iZUT+gFuSNTPk/CZv/SliBL+ksukjz+aIOxl5TCX2KUsU
	OL/hVHHCvUakSVHbiYD1l1rQHebzjuxf8zJWh08ZdkM0chHle9SwhQveHW4FOkTz2YiN54f4qSu
	sJxWqD9cxQQFprWvekN5M7yu4mqNsQZBoWHzXOvARuR+KP5r5bC/iFIpytdtNx79k/uxSlntyBJ
	TyOnT1YV1iuv0=
X-Received: by 2002:a05:6820:5703:20b0:71a:ef4a:8684 with SMTP id
 006d021491bc7-71b395213a7mr14074658eaf.59.1795771719556; Fri, 27 Nov 2026
 01:28:39 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 27 Nov 2026 04:28:38 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: getfeus@gmail.com
Date: Fri, 27 Nov 2026 04:28:38 -0500
X-Gm-Features: Aa3M54pU1a7yp7wVeaxARQpBCGw-lDvj9PbMOs8vidCd9nBQqqFWYBMApYiimPo
Message-ID: <CA+m4KrB1p2u_y92phm-xpn3up=kebi1OmiVc3X4CCdFzHT9-5Q@mail.gmail.com>
Subject: [PATCH] arm64: dts: qcom: gaokun3: Disable the cluster idle state
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The Huawei MateBook E Go fails to resume from suspend-to-idle when the
SC8280XP cluster idle state (PSCI parameter 0x4100c344) is available.
In a same-kernel and same-initramfs comparison with the RTC alarm
disabled, the power-button wake led to the boot menu with the state
available. With only the cluster idle state reference removed, the
system resumed in the same boot.

Remove the cluster's domain-idle-states property from the gaokun3
board description. Keep the CPU power-domain topology and per-CPU
idle states. This also removes the shared cluster state from runtime
idle on this board.

Verified on a GK-W7X with firmware 2.18. Using the same local kernel
and a DTB differing only by this property, the system resumed in the
same boot after 5 minutes and 19 minutes on AC power.

Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
---
--- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
@@ -365,6 +365,14 @@
 	};
 };

+/*
+ * The cluster idle state prevents s2idle resume on this board.
+ * Keep the per-CPU idle states available.
+ */
+&cluster_pd {
+	/delete-property/ domain-idle-states;
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm8350-rpmh-regulators";
