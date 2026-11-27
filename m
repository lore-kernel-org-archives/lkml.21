Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797400;
	b=BPGfq06rLpf8ThHKB+hpl2TpYrZJypzHhKb2ImEcpLCEGqwsEWebB55P7JufCRAQTDaW
	 XDgk4LtE3wsD3pMzyZemz9nrAFTmjud48tUb96ZFLalAe6a/iOrD/LCUVlSe97NyJ57fl
	 dI2qJ96Y7HL9J1YyGf8EwQdgiB8Jip7D5+8scwd0pbLA5lSBG4zBssYvvkj+S84dVxI47
	 A+VxQZdqKAFalVL+HbIy4a4NdSDyV4v0hJVlFXbi94iIHtROTb0jwlNcsllVoF5BL2a8A
	 sfjDZIzbZoDu2qrExUJOwgem3DIOa8Lf43lNLKHuQ4F84Ss0S1zbk6VEAKq5o7NLJ5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Tg6KFP5XFzkAyQjLfZmU84t0tWUyWBd7hqF2C+KuWOI=;
	b=UsxSpxw7x1Q/25caGn0aSnOGc+C/Ap8OKPHGdramOQTYmTqakp1fZxMNRWuzEQtO/YMW
	 4zoh6qq79LgZFxzzSvG8P62Cjsj1JOlOQEKVrww9h7XXvMlmJorJGCBAk/NG+RFikxiKl
	 fe36QwqUkuDloHZmJnOzHl1SHqZ67uukC33ENZxI9dNFDsC7q80wHFKhFRb652Pj+s3BP
	 mz4V/KVd5n+BG+lRlOj0W809M5fQFrYiaVIvUHHKiH8wXpBDVv0s/Ur1x4Bnr3mlsDqee
	 im6NcttTmpy3tAqBvtEXmuw3S7QXBzPzy2Gda9D/p3o2MqiRTVMVkIWtVnllKPXV1sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EtAEAc5d;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7C4606A693
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F7C4606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EtAEAc5d
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4322d310e7so404810466b.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797398; x=1796402198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tg6KFP5XFzkAyQjLfZmU84t0tWUyWBd7hqF2C+KuWOI=;
        b=EtAEAc5dSrkfySaFBvC0m7U6FbehO2Eg7mr34lyQ9l4C+2rQKijtmXteMW7g5HTDGj
         GWJlAVzuoJrh2c/9EnPL5/y7REQYxV7JkZLIskhm5jy++4wMUiJ5UpaTsoKW4j+BAplV
         TzlnGd/OmEI/6RnHWGHy6nJfzdJeZD41+VMZ0mYSzVi4TT2ndCKXMa6ocnRrTt+j00sR
         tLHyiyV5oJ3yf3JJBvwVknYiJ3hItXa4UfyjFDvmypjqhrk4z9GEv6bBNDfsYvCrzXaR
         udpOrOxQzXbDhpMGAi8fBV2Q+WILt+zM4RzhLEn7tH/v5vyf6T9IfrUTpBiFepoPpo49
         z7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797398; x=1796402198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tg6KFP5XFzkAyQjLfZmU84t0tWUyWBd7hqF2C+KuWOI=;
        b=r2lZCE4P5E13AmvZvY1f/oxAT6gGyZwlkcv+0gaJ6evhLRyowIgdLXFj/n3e9Qa2aI
         TzFUa/DnpvtmNpZ+p5swa/vcnBibo7fj8+FMXBoU1fhgeN6VvTirKwUQ5KQGzt/M8V/R
         3gJ1E8RJ3bTtK59NnxUc7N13R03wdDIn0/RoV8YUlDw5+R/frcsrDPTelGKJoeLZpTa5
         lkZ8Vm2Qj04b7g68HQEcPx5fS65UGqspa1aFmq4J+uwEXudtwVzVE8umOTR3Wm9AM7bK
         T+MKTAoujT18IPjWbGIHJXiZLCidFMwxIe5GRt3xAyAcDCGwvrne0RYKBh0W2gtbVgOk
         bnSA==
X-Gm-Message-State: APuU4Z9BOymLZ7d1+1NXOdAWgyfC8LmE8+JBHvbfA8VuCQCYqwReGpQk
	7cLnbzy052NajvinDZbHGRRv460p0Rm5Auq6U3+G2A6U7RviIy7PkGrM
X-Gm-Gg: AZFdTZfwHk5VnjTW3tOW0iO780wC+HmQ6jp/rBh8DRF+kjAeJmVeQeWTtRlbAvBSTg2
	1OU7tig47dvt7vw7wQqv9zvChbVP4cmyhsAeJh75BQsEbM7OtARPevkCE95v5GuLk3gAF7j5Hbh
	+qz9zLv1+LkJdaoima9lbx7ZegWVYg6FpevIgDwgEP6xnBmY/iW2gB4xgjPMwFtu/EYk0CEmJ2K
	LfUrY9FSmXpCJgzc3mdca8h6f64s8pdiEbv3Q5KbFxnD+UJCV3JCa2FO5nrYeZn38vP3GMUOqto
	4MQlGJi2Il4gvyHzE8MleGPUGJDJaSyYiQE18RYkvOBSuuBFTY9YdHq7CJt5MOuVf3w4NgSDb7s
	UyFE8sQbCmdYFeBuxriJYZ0eLH5Y7W9Yj7hOaW3LHkSbRQN+lu2Fj++gORjgoqljcAKfOOs+GV2
	MoOO+n9dElLvatPun2QFSyuZyhyGzsMf6hDslgmUew23LHzC7KYG7N3rax9zVoCtQLXCVczr+LC
	zVVEfaw0HTIOQvD32W9ZK5rSo6LszIgoTjN3MBWL75FtiAqc3bpO87Djv6lTBkz4jFhst72YbLG
	r1BGisrloIItpFK8bpfX9c5UWMJs1nNVsMhL4n+7f4pi0gz6OesDa0w3j3uW7biFn2ws9PHO7f0
	REMwcTMIodcQ=
X-Received: by 2002:a17:907:d20:b0:c50:4983:5d8c with SMTP id a640c23a62f3a-c513ab42460mr2116372466b.34.1795797398460;
        Fri, 27 Nov 2026 08:36:38 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae9dc7asm893079566b.41.2026.11.27.08.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:36:37 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 3/3] regulator: dt-bindings: maxim,max8907: Document io-channel-cells property
Date: Fri, 27 Nov 2026 18:36:12 +0200
Message-ID: <20261127163612.280186-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127163612.280186-1-clamor95@gmail.com>
References: <20261127163612.280186-1-clamor95@gmail.com>
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

The Maxim MAX8907 has a built-in 8-channel ADC. It does not require any
Device Tree-based configuration and is folded into the main PMIC
node. Document the io-channel-cells property in PMIC's node to be able to
request channel data in the Device Tree using the phandle of the PMIC.

Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
index ee1a305d1c210..ccdeb9ba21e26 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
@@ -27,6 +27,9 @@ properties:
 
   system-power-controller: true
 
+  "#io-channel-cells":
+    const: 1
+
   mbatt-supply:
     description:
       The input supply for MBATT, BBAT, SDBY, VRTC.
-- 
2.53.0

