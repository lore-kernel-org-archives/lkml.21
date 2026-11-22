Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795374520;
	b=USNKOrFEcnIRpwBH+SBNItxXTb2kP4FSKCydz858oQLUWVAPW51YIebVouVeuQN5e5Ji
	 K+4SH64E9ye1A4l6PfYvDE1tKEW9QaiD/ruc5mAaMDsESyXbIAfzKuaic3hIpMbjOZEmE
	 //UXq3u8kmuc+ba+GyYUyCHi4K5Gadma0aKGUV3zClcHFLHz6I6F8OrGBRoKR7K0NtIVW
	 f4pPVKNNgVoe9UOf4V6bVVgmjD/r66CbCaSt9kVNVSQNU7FFDy6cXSAe+zGnEFrXQxHMF
	 VUacIGUCKxH0n+x48sjcrn9e0T8j0s3oqpFjqJ5ZOsvwXtUl7mRw80VakgEEYUlD+QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374520;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=73sbTOBTKeNDVIbWsqHqrOHKy267PO+zwpsv2AnOAio=;
	b=HhMeq+C9FAG1CxCbFoJau7CkWjc6OrJVcdg+qFu2BSSbybBGbMX8H7makzrlLuLRbWFZ
	 suhhbPQIfwVTGk3VbuZ/myUTpCeD9G6uEqlx+kdNz0v19btoS2mf8MWYeCNaX4Do6cFpE
	 nWjcmephk8FhFSyE5n8INmmct/PLdgQjfP1osoGEPZXBLEe3J7yswlZcTeX1H8ekCVC9M
	 GhqjiAkf0MuXEhdsJ+mz2OeZFg6Q2Yadj1Bu0+WUUxT+aoF9LMkIfsXgDwhGc78Y6R5Pu
	 y4CCuI7omZXQhawm32A+EgV7Zla6fbBFL1BdDDIjDD+zcyYezwwRiFgUc9Ajl91vhbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=imBWeynG;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC81A606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC81A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=imBWeynG
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso19489025e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795374518; x=1795979318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=73sbTOBTKeNDVIbWsqHqrOHKy267PO+zwpsv2AnOAio=;
        b=imBWeynG+POI9udwOD/SHv9YDeIv8X0KAHUSoUTVByALVgl4/If+IUmBpPfNHM1+Kq
         sDacnPNicFuOcpl+mEzUhOFwiJGuH+ljFCxYLG/qjx29zAtd7VndewJp8+tuUx6KQq9w
         XL8awbtO5vIktvddL81lnknmie4D88Wqc6YzCsf9LU/hgBBthvjT/f9N5W3jeaI6G43P
         C63la+MoksV14gtEos/ViauIZLD2sY1ix+szq2SUVvbHGTUsT8rBaSmfQM3qw3kvSXUc
         YIyOZpUno/lXMor2w4dx+sM1SCmc+bDxD4irpO0prlt08D4yZ0IFR0CaaLojNm5Wt1mJ
         cKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795374518; x=1795979318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=73sbTOBTKeNDVIbWsqHqrOHKy267PO+zwpsv2AnOAio=;
        b=ivYUCzspQ83G6y9/Zk1sXSDCSw1mE+WjgBbK7oz8LgjQvIUqgDcKtn1q71D1pD61Y5
         idjMDZqNv8q4SxIVfP2HLj6NlclwiBiEd5dvqgRIzWcq8Znwwywi6+34scokxsfdF0It
         W/8dU90Ij/x+ne+OJ8uyvmXF8CnSEXj5NWgkdXJgbT+jm8fZa1teOdkG3w6ifTVz1U85
         +CFTcR+ikaDcVV9zUJ/SZLHbjxPywHrBhbobMcoknUtXIxOhYOcF5L6Bs0ZHhZ/kzcL1
         hvv9u/PUz7ujtfsM1pE+Eoggs/ka5toZmrxFOMYq7enKV/Mg+ZDJW7UGLWnT23wGDFDe
         zfcw==
X-Forwarded-Encrypted: i=1; AL+hErFwTiwKWYiSF7lEBx9g9SKKueyx+QwJT4uh29XNtmJZeds11T8co+a/9ZhN1uJj1nBGlHDUO8iaNNs8GoU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vOE65HpKqgj+p+KCStVzXvwqesu5kYV9BY5R8BvidY4bf954e
	v2FFvIWLl9Q/HIagHom4vygRgTqGFTSE2LHqDQcEERdeGbCg0vd0/fYm94KZNoUG6hU=
X-Gm-Gg: AZFdTZfe0GaDP9nTyvLIuUmaU/b6nfXntbyztjSP1bzovzkdrBT02WZY1rgA+ZPYonc
	ZPF/Ibu1KnMnGX/xeT3xiThi5tYQPjgYctuxHx5gwYWmmumJgZUC+1xkCFCoaxGMW9idubKBmej
	9QICRc2L5lOLLVN5NsIe9L5KBN2wTDQt+a5ekuNbta5exYMqjZZ8eIGfSHJYA9M6ysf6rU3swJg
	ckM6NbcKNMNUiJZAtmu2Yd+H9FJi/ejaZgxU4kTIl37tOe6opFKVVHce8vQCK1+AK7Qc2AopL5t
	0O9dZWTCZd/8r/gYtAneSvwjHjNH9VxusSQyDMPlIPTlQZSR0wHCYlymglLiiMaNe4SE+QD1Sr7
	VqXzPQgpB5B7Fdirmk9yPtJTNNoYaVyVmyXMOm4F7AUIoGLEJvVv+pOVZIrKZTT4IQx0OA57M0+
	6Ed6khd+10vdRbm7slzR7b44pLpldWp8z9sq25tH/rnST/1tvhQK5aji1EKT2Rfz+ZFYjYAWT/W
	tfY2ttDx64RLXk3fLzfMM8ZOHKEQwKyi3ogW8ZWxTWb2D9dU6H6bXvsc4xuZSNyanKgN8USc8wc
	xoqn02QVpDggndBLD+HRmqEzYgIqETx/IeTXix2QPhQWScTJSDlxh8Tt70DVkJoJRkoQOVErLhj
	Ov1rYepLrYKQ=
X-Received: by 2002:a05:600c:1d03:b0:4bb:6118:4f57 with SMTP id 5b1f17b1804b1-4bb888130cfmr226843875e9.18.1795374518011;
        Sun, 22 Nov 2026 11:08:38 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm103080395e9.3.2026.11.22.11.08.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 11:08:37 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.li@nxp.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] iio: magnetometer: mmc5633: Binding, supply and mount matrix
Date: Sun, 22 Nov 2026 20:08:33 +0100
Message-ID: <20261122190836.66111-1-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
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

The MMC5603 and MMC5633 are listed in trivial-devices.yaml, but boards
need to describe their supply and orientation. Patch 1 gives them a
binding of their own. These bindings are also used by PebbleOS, which
is where the need came from.

Patches 2 and 3 add the matching support to the driver. I have no board
running Linux with these sensors, so they are only compile tested (W=1);
feel free to take only patch 1 if you prefer.

Changes in v2:
- Cover the MMC5633 too, including its I3C connection (Jonathan)
- Add supply and mount matrix support to the driver (Jonathan)
- Drop the mention of the missing I/O supply (Jonathan)

v1: https://lore.kernel.org/all/20261122093412.71604-1-gerard@teslabs.com/

Gerard Marull-Paretas (3):
  dt-bindings: iio: magnetometer: Add MEMSIC MMC5603 and MMC5633
  iio: magnetometer: mmc5633: Enable the VDD supply
  iio: magnetometer: mmc5633: Add mount matrix support

 .../iio/magnetometer/memsic,mmc5633.yaml      | 61 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  4 --
 drivers/iio/magnetometer/mmc5633.c            | 28 +++++++++
 3 files changed, 89 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5633.yaml


base-commit: c44104f3642da720164042623e4832836aefdd8e
-- 
2.45.2

