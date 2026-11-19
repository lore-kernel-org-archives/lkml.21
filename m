Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107266;
	b=F0yjAc8IF+WDibIzSoZa1bFtBYoXhQFrH07MqpcQ0gaReMan00J75dXntjAKtu26B+cF
	 95v02Hf/bMCWNH5T6bIDWN/livP2YyAM0dbEfcIoZ5M5lul4IyGIz0bS7TnojV2ggROHc
	 k1bQGe5eGmhHa+RNp6us5HOY2M+D2XvQh5OA+IY9pZlRoEaN69URGymCvBM7+7IRqwiwI
	 JU617ByHf0CpoAKTl7SqIF9kaRkceSxZVWmFg+/hJ+RV3QpKk8FuGX34+EGhMquZUuGbr
	 MlswLNZeNLZPJ8IySFlrxExANC9B7GH1sh3OSY8RpF9lwpPtRaHAP1qnT54Hiv6QxDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
	b=B96FJQUP1X3151VwaF+ByoyUyjpJgHMZm5QfFyes502zL4Z3f6RVYX6EcTs9eSe8IAe2
	 Ay3aE8SRGV8Faiz8Sm3X5D0SfLQPpvB+nx73npL0QZue5rKDEdlVF6LxgZmVBz43rnFth
	 CKAU0gkOrAjhAvni86iHotcFCWZwcSveNy92sS+m9LlB1wcuGifhhy306MOa1w2v22Ztr
	 Wh9WnIhxtbhHhSURla9hdYIrcpDq52XX/WTDzAV4Y8l84eTRQQjvh+GLCmAOpGM6IFMxY
	 4makjxj/ttW9zM6+XJebM9/RZnqZ8mV0Ify5nbvGG2B6xSEgd/y9YcmU4lRJQd57wUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yMU5F7pE;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470CB60A2606
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 470CB60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yMU5F7pE
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4aa5833c263so736190f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107265; x=1795712065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=yMU5F7pEic3WVSBK24VbKUxHb+6uvJTAIVgjWdxbMw4XrPOaSJE7r91tNCsliqQHaC
         qUZ5AZm1wcdjhg5SrKK/Ip3xFQeC4WH3EWfuhKGt2XT4qXNdxGvhP4n4JZToUqxlS8Ow
         I92yF98dqmRTf/ArtA4sBnN+AainR8sDe9FkRY0ZduALSURpwPh14khnTslQ5LzzN2NT
         wgcHnaSFPMaj8w83bxuyS0gTYRA9qb9F8740IOKVqC2JpoJaV55hh+Ddm3gPRJLYGvse
         aP2oDAyuagJ3p7ACBi+M3SSu54fU1v7T73M9/axItnrn/NlR3Y8jwyws5kkRF8YkbAgk
         QDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107265; x=1795712065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=QIITpmS95srciHGuLg4uelVabQ71HDWr8M+q1IZdP8/FNTsa4JNkS1Cub5o90slQ09
         KPyhN7Pl0V2/f7bEE+41E9VB11uBIVs4JotGmakj9IuiNQecUg/dA7rsdCctyFL+4Was
         4zYGLSd65CcgkmLBsMMizmsoWFzProFZ7stP3H0iNpVjJMeeEOM0u/UJbQn3zWM0WWPE
         G1nsZPJx0LaZX9VEx88KnwrSQMVEHHbmLx7esGiBu5YVS70AvTv4kYjWK53vsQOOvN3M
         mGj+fYm1vAiUZCWX+uwxrElNHap+dh4TFX9ec/bJ8aciF9XSiCzdWFCKwqRET45v0VIp
         qR/Q==
X-Forwarded-Encrypted: i=1; AL+hErHiMxybR6lNtC+WskLh3fbujcHn8LZsOoyoVNL8cwBDPPsKYkGpHkasQQN/Q/SfJy262heaaAFCsS8Wyug=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QEvtC16VQK2M0jeLhObaa4ZittWYmSK1OjjDRruv17aU65iKw
	wqgJ03UDkjgEYxhTpqEMOG+jMWT25+GyioD2kYcgHPIW0qIO/P7MQq/A
X-Gm-Gg: AYBFou2Yi7Pt3g6lK9bslgquTFKPVjNHiIAozPRvpezeOWWeDrNbWzioPvsmrrjwgv0
	PgDKlrmIQExCEIfJNBoPgdPUIHL4EDdWrTiHzYx5o64bEa6aiHIU5oEQSqFSx8lKr82u8Q+98fd
	GuB6ahA/iybkZpP+vwWjDaeBlnUGduxcg3aP7IaqR8BOP/k3aQSC1nv4Vqgly7QqQEzP+u8lRtC
	Hm6A6xBrJR4ejy3Bp9RNaze1aNfIZlHYrchFIcisMrkCAWQWXgVMIfWZMEu1qeUjYDJd9Kxo1y/
	gwHZMX0PBCg7Vg8FdXcKYd8ahtP4/q3q7HmIUbHIgHA7Lyvy5CFSR2rerbGchWk449g+NhLa22Z
	EVBB8YnoBWOF6RK6kM6VaA3YwhZSS1aB7Qg/g+M/sryvHfEvWXZutYn9CzDOswxuK5tQd5iKcLC
	XkHPS9fLxM7JC4njhg0+YGGGE7jZWQfIVOqScdOdNgLveOD1GrCjUqF+qvAG5WovLiFdrGVpqFz
	XrpSJXleOgru6A/Ldf2TwEBtEoaKKiGHFusCZI841d8ivxVx4+ZexFWIFWUHLOZiggOguALONnv
	cAfbbN5ZO1jSnqdchEBqlLDbO5M93GTBrh2PS7hQuOVkTQt7/3KbEMwTMghTvjCAkJlrt3qi8lw
	=
X-Received: by 2002:a05:600c:6749:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4bb8881a294mr1876395e9.25.1795107264467;
        Thu, 19 Nov 2026 08:54:24 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm9894555e9.0.2026.11.19.08.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:54:24 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v3 01/10] dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
Date: Thu, 19 Nov 2026 17:54:11 +0100
Message-Id: <20261119165420.24466-2-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261119165420.24466-1-rofikcoga@gmail.com>
References: <20261119165420.24466-1-rofikcoga@gmail.com>
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

Document the compatible for the LG V60 ThinQ 5G (timelm), based on
the Qualcomm SM8250 platform.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1ef..85635a871e7f3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1139,6 +1139,7 @@ properties:
 
       - items:
           - enum:
+              - lg,timelm
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp
-- 
2.39.5

