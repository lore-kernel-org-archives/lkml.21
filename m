Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797398;
	b=u7qephwLdgsOycFmOTCooAs6OJCiId8qM6gCY56M1Wslc2gsd20Qip2gkJe6QwkVjVbn
	 fDK9yqulInjaeh+76hFXyN5xLNFx0pXmTuintwmCuIZ/Qx4Q5b3xSX5pCe3ShdcmYXClw
	 IQYRAM+kWp1IVZhj0w1NpX79NBGtpMuY8TCuKKaG+GppGs/HTLpFzLLrU3PTAarK+9n6m
	 zb5NyKRikHtjfCWgNJnvnpiWhDhJlCjKm6YYkJwQLn/XyTX5dKtLKPT0XkWlapTsakC34
	 4yBYK+EaJul1CdT/RWfdTQAIvaKGMyI9sWtQOdVJjU9qssnSpO09PDRdrz2T25SKQ2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=jE1IwgfT43a9KWd1BnGfLYSEKePpQ66VYgXQTyv6r2I=;
	b=egEBRHs296CU79sl48O6OBQYR+N0F8QfCr576X9cbEbajApuiovC6UJW6c/bqmiQx9mH
	 Z8sKSnczsFHY6IiHXZqp+88zNga4guGOm92trFsP/aWE+7AC6wh77LYbmEYtB8hDoy69t
	 JGxuJ5RWFK1a3LahqLyjc9Le0hs/nprkWBSunsUob2DGeRRRlMjfGcvTzQDihpBJgsROG
	 htqVUS6HCsaYOeltJ92AB7dn4j0dPLN50ur1afcpEsEX6+rsLKW4OvaCPeX+JjFF7+9NN
	 xd55BpPiiauFx3sTuI4IGwhITv3C/MHsEpdf9YjLRBJ97Nyab1i4N3DG/cwL1AHRWQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sFe8BE8y;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B97E606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B97E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sFe8BE8y
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c51373ae637so413492466b.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797395; x=1796402195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jE1IwgfT43a9KWd1BnGfLYSEKePpQ66VYgXQTyv6r2I=;
        b=sFe8BE8yvCFbIDw+CsrPHr8Oh6hr14pdlieAzCrmoHZE3ZMpgdUbmMi4dFLUM7LftH
         jgh4p/H7WberYSOXX+eYIJKAdgTJWBZjATz+MWJlgTMNkvT0Qp9cSoO+4EWdy2aS2crq
         IrBPTWcL4e7hNh58xsisSlsDfJ9GC+YdJvZvtBqCnSNS8WoyPxqnnQdSKNDTcGPlJceJ
         h85xE9yPhs67YMc9Oa/uYmA3V9d5jmDCvfmTx6LS35RgnfvWgiLpMWzPQydCfmEpG/yR
         pstezSGsCBx2LSob9aKI6aUNwdd0u041ZaTtYlqXUrIZvMZ1IFHu4vRQTxGjEg/52ix1
         wFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797395; x=1796402195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jE1IwgfT43a9KWd1BnGfLYSEKePpQ66VYgXQTyv6r2I=;
        b=Ge5Vr7OFwf+g7wzk/3HcRHbIg+RPgNT1QkdZzf8MRBvWbejZo9R29aHICVr1S0Rffv
         xZTg+sx4sh8h9bCKaOcDwkivKTYno1+Dxv+ta+GzhesFJGabhqiAfjHUYuvzYq5citMD
         qGacleL4wzqqL9a7UGvQFn9VCNLf3jy1KLqju/7+Q2XgFklktPtFznY6Lf05AhR2ndDv
         ruiJ4wtNoFxuc9Gq0NwH03J6rF95fNHG1p5a1iMwvNlN0QWz5IPDhQC6eBfCeIpCmygX
         9hFxRgIyOJlr02siaijYuDx/nCX81waRGuhDnWW9I3Gcy2JQeRF0zaD4sIjtK6nSw9k8
         T8PA==
X-Gm-Message-State: APuU4Z/M+mePu3PhcHkVXLL6HSCaMzU0zfDoYl/iQstBPDhcaZjTQupj
	W6i4uKUkyB5tTuHp9NHib4+sNSsgLdsmWTB1HrcSm1Iz+aQN0oRg7Hku
X-Gm-Gg: AZFdTZeVnu0xdug0GRTzQNk9icj3WG9A9J8uufdcr/qabdeFi8pWGaXCx9F66h83gUY
	NsNCBbZEYJRGBF4rcfZqVmhhVly7H7aQiqpl844xFSk8qnkL3Z7S99CGmTasHnbwIPhW14+It/M
	mZe+l6WaHl2DzyjG5l/4I5YNksnul7YRuDzgeKrQO/KVTmBpCrBaDqzVJDhakriuXJFnsQm6y30
	UJsm/f/SHXbzjCRq2zl9P3L2jm59ef/ODZ7FY59xhiW10oJFSe+yFyr8Kl3Ym5RNf+a8ljeW7I2
	pN3Qa5jNdgMvRzwpoLEFVD+kpyBi7GrEunLpGBhc/2Qv3daadYeBoK0OglPDJ8dh2zq+lr4GFK1
	TBzGBNuBdHE0HbVGuZZCfFPgtUrh1FDtu7W6x8Wb9LQJFUfEklxdfVs6/nMBe6e/FwOs/7AE4CD
	7rzeB9MM8rTJR2zgzHGS54hLYCzDem9D8OkiFv9TWW+AMsRwqu8ffVQG8i7NpHXsjjarzTs1QUO
	DLWJZZFggo3QO2NCFJo6y0EAvnOtIFPMTuzqWmGgmwyg6tA9TUgs2lRX9pDcjDwlA4Gv4E3tTjH
	1Vd+jN9LtWoun/EYoSU3IJlLzgcMDat4l8LJoxXQNVeE7jShFF4Vtm77AAAp7zbV0oJWolbKwRH
	mBUPMaONxsd8=
X-Received: by 2002:a17:907:a890:b0:c41:55b4:d88b with SMTP id a640c23a62f3a-c513ab14402mr2259218266b.43.1795797395343;
        Fri, 27 Nov 2026 08:36:35 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae9dc7asm893079566b.41.2026.11.27.08.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:36:34 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 0/3] regulator: dt-bindings: maxim,max8907: for Mark
Date: Fri, 27 Nov 2026 18:36:09 +0200
Message-ID: <20261127163612.280186-1-clamor95@gmail.com>
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

All changes which should be picked into regulator subsystem collected across
all my patches for MAX8907.

Svyatoslav Ryhel (3):
  regulator: dt-bindings: maxim,max8907: Convert to DT schema
  regulator: dt-bindings: maxim,max8907: Document LED support
  regulator: dt-bindings: maxim,max8907: Document io-channel-cells
    property

 .../devicetree/bindings/regulator/max8907.txt |  69 -----
 .../bindings/regulator/maxim,max8907.yaml     | 290 ++++++++++++++++++
 2 files changed, 290 insertions(+), 69 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml

-- 
2.53.0

