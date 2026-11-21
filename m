Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795245326;
	b=YAAwkSQZuytSU5Xu8H2SftS9+eLHhz8fYRbUSiVOMfpUcdFmdY/EPkfqkZSmsnSiZXKA
	 UMhFSEvNFBKWjBiHtXUtb2y007JYvSA6y6B8g7E+XGL6ccA/5XIRLGbHLT2NKNQ2HzHA3
	 /U07Ptk7mJTUjn00N1L225tSkyYRDlXe03bOLM9ZxLaW0MdPFlyZfGkxoUwVhTxRKKy+W
	 1y9ffMpd8wBBwvv6V7zw7ZC3d5sIMfvNzq2isjvBHBwIMRrW8ik5X/jptJ3tFefnw8IJM
	 PiCNpRa97NDVuhvCYwvuwBQuLBKSQdTl4ezEQqPbwmKi1gN7bA6Uo8RlAKeUF2qg7eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795245326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zzioOxlkcVp3dTuKm57v0/MU3pavFbjKKtH3W6hDDvY=;
	b=1ts73kLxDjoIrNMXCgb+Ym5ziisxRZ7rJXH7+eKBpP0F0MqPt3sEW/DGJqAJUaaMFpku
	 y1jYIVmrsDOYZZiGP+rUasrWncZCu/Y/MhtrgMElwxXmovfnOmysGrAd2CdAdMsmBiEvz
	 PiuXLgtOMGv1l4U4XhePpxwsJuxn5Tijk2uiMjBkfUqIrquJ0/LIy34G/IYxaGieOm6Nj
	 jIUHM62nMk+6tXBzsFQHCufSPfdf/Jo2gTpUaBA0V2VoV3XuEeZLCoOqSFPR24z/ao1IY
	 Zw6aVOSiujtU4EAFIP8C1eVLzgoYVoqOk1uGUUBBjs+6vW7IbLasYbep9cyFy8oeYZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z593fwZu;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487A0606A325
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 487A0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z593fwZu
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f06ff94acfso228365ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795245324; x=1795850124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zzioOxlkcVp3dTuKm57v0/MU3pavFbjKKtH3W6hDDvY=;
        b=Z593fwZu64OW9fpBELLINctYQBs/+O2/bVgeOTcOiBIAYwMqP42vlTcmUFqpZtdwOU
         MZPWxW/llJufQxe7CE2/dUSsl0jXzV/aChSVh/nLfUQFT2QPIViFX4khM9ovW9y7BJ9n
         wZrqiNrUJ+Wd8CzMlrf+w+C+AQ4+74Qr5IcC+84WT6sphalVWD29bfWXCd2vrXtTgkXJ
         Ffjx2j4WLfklvPEZZLlRY1i/Ruz2iWQ2C1Yz7PmDU2KRTgjR6qAcUgVT/t2IvXm1ct6p
         tXbgPLxoCEug0kc/Vg3JCN7S80iAD5kyE4Wk8yVemNY5UsO7QFwDI0XBokbkiU1ttDSG
         sSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795245324; x=1795850124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zzioOxlkcVp3dTuKm57v0/MU3pavFbjKKtH3W6hDDvY=;
        b=jGbL6YovYS5ytzjvN4WZ4TDxRUP9GxNFKaU5/Jip0iAPnOOTBO1cfaviOE05Jh3Xwn
         y03x0qwBSqTbKUkdFl6QBtYbbN/yfFtEnfzanbSKNoz7QVD1WoGIEzA45jUEDj3jX7MD
         l7X53carCFklvZPV7F9TP5/L31FkBJPyf6hk2/0moIrZpGS4fe48d9e0GcxPOpj1KEla
         G8wC0jar1x3x3IhFULJwqO8Z3rMjar6uhDw2s3JYmb3F16WpmAcN/wR6+OI53fzw8KYB
         Mdrr8vJ3SNanOfJuuWzZl7P0RnvKct0SSYAIerGRDxqr7TvyRsf9wBxYOIjZ0d+xbVIY
         oFtw==
X-Forwarded-Encrypted: i=1; AL+hErEcZ3c9I5hQkYHEA0Zb0wKZ+e+DPeN15AFlBqL7N4TvNlNYmcZn/g9x59MFx5Y8SozzPX8H8bAZSrb3G0w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lI0hnb+0kqTvnunkifebKdOk5AhIdqpX1dBs74OsyfyyyzqkI
	oHctg+UzKI2O/Wq3KGa6pEENPpxCE7+kO6cRhAu39Uu4lL6D549/T+3s
X-Gm-Gg: AZFdTZdbaxJ/+E6MyvfhzkY2iObFmIdChnjC24a5fM7dyG8jeXtdDIQ8rfN98W8JHZo
	bDfPHbphVtoEVP9RNZrbC85rhFCi2xr/WXKoVg/uhR/5F/AY+0eRJwmTe7HfZHzO//nmNu5esew
	tzTeezeSvHTRU5OCc62Lrfp+cZ5eeBzP1zbStdsl70khj3FMT9kAVysma+sKQLpRkMx9E9j5nsW
	1fSar5F7MzzaFR+44FWsMOP6kBEbkHAPXB2LAytYejnkK8FkHcN3YxpiHm412jF8yxPw831hOe6
	+G4LnbugQmRy4igfLB5aBSoRsaqdvK5c6cFQmjBm/m05nafIGHKqsEPIlWDGQw98/o9qDfnH/Ao
	ORcV+HC/YLO69w+CMNpq8Jl+seVi8+E5BaKXP4zVh/KbJYvs6pO1bar+YNaGGgLJTssQYFZz4sw
	285PimvdluHEQwxr3c4ndNUL3x/JEgOYWrKk7GiCeE0WmAbHa7UIMmEBBU7q8ikESPIYPIAI1Ct
	3+d6n+gxGu0B8G0Vpv/PeKnKW6/EEQrmIhSWn73itz9dkoZpsxRr4NksHgXVWv0gjz2xhxauttl
	XNioGmb8Oe7c8k4A/8PsB1Em
X-Received: by 2002:a17:902:db06:b0:2ef:efaa:17ae with SMTP id d9443c01a7336-2f03f1bacacmr49222005ad.71.1795245324420;
        Fri, 20 Nov 2026 23:15:24 -0800 (PST)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04f6049dfsm13508675ad.19.2026.11.20.23.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 23:15:24 -0800 (PST)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH 0/3] Bluetooth: MGMT: Fix pending command races
Date: Sat, 21 Nov 2026 15:15:15 +0800
Message-Id: <pm-bluetooth-objects-candidate-0167-v9-45c99868af18e41665a3-0@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Keep the socket alive across SET_LE work, use the existing pending
command claim for immediate pairing completion, and serialize extended
advertising data with pending parameter requests.

Cen Zhang (3):
  Bluetooth: MGMT: Fix use-after-free in set_le_sync
  Bluetooth: MGMT: Claim pending pairing before immediate completion
  Bluetooth: MGMT: Reject advertising data while parameters are pending

 net/bluetooth/mgmt.c | 54 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 43 insertions(+), 11 deletions(-)

---
