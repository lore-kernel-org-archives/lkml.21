Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638155;
	b=ENFLWmaAdTQegl6bw/p/oVJXNPEN5Zl1UOQk2ZgaePUVjbbSgDiM5iVO3eH8TZICBywC
	 +nGhpaAsHULb+C6bsuF16bOIq9luaEVjhY1Yt0AHl0BqhQ2kX5SAi8RxgV1N1G/ruZTRN
	 K9M/1atD8plVMYSMxeaDYC/PpEBaEsitcmthGSJk8dZj5xmP4I/0CvC34i0wFkY37dLi3
	 q7skcX62oC+M+0CRAwht53R5UL0JDItfNJC7Ax1vyBmyR1Q0mgIhk652GojKflb4fB2mF
	 I42k3KzakaGWW8wKg2j863KnuqKYYG4HvorUOqgVRRKWoJlWTbb7dsmxT9WuWnhMD9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638155;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Tw6abP5TGyJaCCJ/3YqhHDtPs9CAOD/H6iKvRgGyxpM=;
	b=im+m6Scg4kXInMuHd/wN3HIYkYKgaNFLidhqajJu+Anr8FoIIuQAvtu2VzHZwp4lLVBz
	 6D1wtXtE8u98sCxudBRDqw7YOqzWSzxQglxpfqkx7c8B8NwFZMuvsBZfEWga4w7dhDf7+
	 wc5szpFaKHes8K5hcklNPfuVYAqSIkXZDynY0E1mGutdQjRYKy1fOrjRPspdtflra6uxg
	 79/iOdtdaMN1mI8ZEOqiWWDozZTbXWn08mruiN+xjj0Czpr+4Nac+AqRx9UUwKSUZyezB
	 Ml64D8e0Yd4bVlnrNtjWVDny4pcMoLIG4z/EL+tFYRw6R0rM0ojZEQrY5AKDtrs4o1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAB5606A330
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DAB5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b4d86f5328so43126897b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:22:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638154; x=1796242954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tw6abP5TGyJaCCJ/3YqhHDtPs9CAOD/H6iKvRgGyxpM=;
        b=LyC/2dJPtHVB5K+QMzOfzp+O+bmngJFpTIbyDek0O6bH2fW4M976SI9F5Qzw4DZCbD
         FWkJNfE5If+g2NXCyDxSkZ3Lvdu5S3Nc2gNSVLs0sWW9kJQ5mUNk2ozncWYx1Og4P6+s
         +xquOGG7Dm52xaqoL+t7SeghhByMvtScEGn0As06W15XPqWe+vbRRkiv11yF4sAN8uz5
         HcshUoJhxYr6VIvLjFb9uFahV93JNR0WN0Ibs1fFHd+/HI9SKNtoNZIVH/jb2ZkIYpbg
         1zFvg2WuctzPa00NshbrMUw6kfe+BrogyhHQpUUOVG50dgr7INGgpk4DZtj5CZjNb0ui
         /i/g==
X-Forwarded-Encrypted: i=1; AL+hErEUphc87Q9Yjrz34XZgg271m/QX+Ez7VEZ/ZJcddd7upHgtsGYrcqA2YSVi3+YxavMpVFCR8zaA+t1Ez8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z82nkMYYgDr/6ky7dBdy/Xqi1dVY+SngR15dM8NvOkveDYxP4Ly
	7X4rCs9DA/HJ3wiksbCORVOefY7qzl3n74ELwIBTO6yAqPebi0STCvLpPLRx7IPqVq8=
X-Gm-Gg: AZFdTZfq32YeWQKPl1TKLZpi+PK8t3lATH8IhDcI2RTJYRrCyJkXey+tZ/EG6DGU0Eu
	Fz59PUV7YI+6+fiGeyTFA5EyR22r/ufymYWi3G8Rwwf+7WsQcJQ4xf0aZcHUGao3A+HjMVu+eWV
	JqS+8924GwhJOOg/SUdlas2DsPgVd9/3jqjiluJkXA5wlq1zqdIoe6/znoD6oRZPKUHQpO5erDS
	ppFECH1ODvrXF1gAxJV5JlC1OtLSttP+Hr6OaVY9AI95K8wy/Uv+fEKsks+aCu3S7XCMyfMXCc6
	J0n1xdfXL8zGLrVP2IxJxlw6jDoE3GOP3NDGWyX46UAfPmMawn3Sdd6YffW2Bitgqx54NxgcZuc
	G/BCRd+HOJDRRNWEkO5JZEypspa7DNtQMQwoyFNbNe6bI8aBJdCBIriL8RX/oW8BTyCFWS7ZQvL
	vH1+8WsKS3ofQZ2T8DQep6+hZmW8L+GfT1JHj93rQf4P66FGW052ecpTH9WqI1NbTgs/3H5MJWJ
	qE6hodryPGcK01rC4M9knH4ZLpwOCzBsHCHncfACsnlaG9yVbqHuLomix9YcRCNL1xKwilpqbI6
	Au9lxpbRHW7v3TxEl2eXmScTZFdteZ44wpAC3loKuD/kJqDg7it18sVwnIHtKrktSla73gJ9N9p
	I3SQYclQ8egshjD4/PHItdeU68yFEoNHetmTozn733+aH4Cgl062EjSH/dr7N8WaKuY1SrwhRZn
	wY69A9ca9dPPPLuzXbhJ2RZMA8
X-Received: by 2002:a05:690c:e06:b0:8b3:59ac:9f5e with SMTP id 00721157ae682-8b5205073a4mr100432837b3.61.1795638154248;
        Wed, 25 Nov 2026 12:22:34 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201bb6c7sm77074377b3.6.2026.11.25.12.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:22:33 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 25 Nov 2026 15:22:28 -0500
Subject: [PATCH v2 1/6] iio: ABI: Move out_resistance_raw_available to
 sysfs-bus-iio
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-iio-ad5246-v2-1-8feeb630f0b6@telaak.dev>
References: <20261125-iio-ad5246-v2-0-8feeb630f0b6@telaak.dev>
In-Reply-To: <20261125-iio-ad5246-v2-0-8feeb630f0b6@telaak.dev>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joseph Telaak <joseph@telaak.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@analog.com, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The available raw values of a resistance output were documented only
for the mcp4531, without the channel index. ds1803, mcp4531, tpl0102
and x9250 all report them, and indexed channels name the attribute
out_resistanceY_raw_available. Document both forms with the other
generic resistance attributes and drop the driver-specific file.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 Documentation/ABI/testing/sysfs-bus-iio                       | 10 ++++++++++
 Documentation/ABI/testing/sysfs-bus-iio-potentiometer-mcp4531 |  8 --------
 MAINTAINERS                                                   |  1 -
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
index 54800847f2ca..83eb616862ea 100644
--- a/Documentation/ABI/testing/sysfs-bus-iio
+++ b/Documentation/ABI/testing/sysfs-bus-iio
@@ -2034,6 +2034,16 @@ Description:
 		Raw (unscaled no offset etc.) resistance reading.
 		Units after application of scale and offset are ohms.
 
+What:		/sys/bus/iio/devices/iio:deviceX/out_resistance_raw_available
+What:		/sys/bus/iio/devices/iio:deviceX/out_resistanceY_raw_available
+Date:		October 2016
+KernelVersion:	4.9
+Contact:	linux-iio@vger.kernel.org
+Description:
+		The range of available raw values, as the minimum value, the
+		step and the maximum value, all enclosed in square brackets.
+		Example: [0 1 256]
+
 What:		/sys/bus/iio/devices/iio:deviceX/in_coverageY_raw
 KernelVersion:	7.2
 Contact:	linux-iio@vger.kernel.org
diff --git a/Documentation/ABI/testing/sysfs-bus-iio-potentiometer-mcp4531 b/Documentation/ABI/testing/sysfs-bus-iio-potentiometer-mcp4531
deleted file mode 100644
index 2a91fbe394fc..000000000000
--- a/Documentation/ABI/testing/sysfs-bus-iio-potentiometer-mcp4531
+++ /dev/null
@@ -1,8 +0,0 @@
-What:		/sys/bus/iio/devices/iio:deviceX/out_resistance_raw_available
-Date:		October 2016
-KernelVersion:	4.9
-Contact:	Peter Rosin <peda@axentia.se>
-Description:
-		The range of available values represented as the minimum value,
-		the step and the maximum value, all enclosed in square brackets.
-		Example: [0 1 256]
diff --git a/MAINTAINERS b/MAINTAINERS
index c74dadb6cea9..ef6033c5edf3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16691,7 +16691,6 @@ MCP4018 AND MCP4531 MICROCHIP DIGITAL POTENTIOMETER DRIVERS
 M:	Peter Rosin <peda@lysator.liu.se>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
-F:	Documentation/ABI/testing/sysfs-bus-iio-potentiometer-mcp4531
 F:	drivers/iio/potentiometer/mcp4018.c
 F:	drivers/iio/potentiometer/mcp4531.c
 

-- 
Git-155)

