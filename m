Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795342686;
	b=GwOa2bs2bk5DKQFNogeb/0OhQY17l8shXs8vGb72Sn/HDWuIRkpk04XE+oHK6YeAyCVG
	 nX+WkWNKFCry6+oLfUEIrkAI1tGG9qRd8/oKnZjFkyMFsZptOTOAXedUuWqDUtdUM1MRO
	 ttLoKAnSxXtOwuR/nhY4wKPF16mCNLNVqaLjYFSeonFbD7GyEd4I4N95tLubwwRZn1x45
	 pBf/LxYKWi9D7Xy3qHKQeW053W1T46VsNqGkcuxeVaJMjdzIcj0qRy6NnFWz9tWghbMHt
	 D3O4O1/crEvnmNovsjecKsP7RtpgsrciMNZsAumP2zL5NDJ0sZKv1lvxgOohaJ40a/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795342686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=99rrteyPoSG7Ruj3FSoV0/w4v3L/FLRH/ej3uZqOdyg=;
	b=SxRgAVvsFZeF/+e9Y+UKc2m4KLystTVyt7CBoja3B38lx0EVZUb+xhpgbFlFdFIuh5ft
	 3PxZ7V9j/X2kEXrd2d3QjUzTmYu12x8I/mEZXggLWlgRkDSo/zx+X6VbDcHftiaX5x04X
	 MOmrIF5SUC8a/4xkjpUZroKz2jfqQcAs5cTAbADptjy4cJnsSGMAMBIxcJI1evSSSELDB
	 uB8kz5ojERtCpqQF2Wrwm9vrPDxXVzEodgV8MsklTmUp3FvT9G5HAHg2cpL+rtw2yTfPl
	 cIwGR0vJwZpGeBKiyjjYBbVHTCTGeTCBpKWg40a+83F8IllwmZK0x2wbLq3zsQ2odCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LsaLevwP;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9C0606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D9C0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LsaLevwP
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cde7e8abf9cso381230a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 02:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795342685; x=1795947485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=99rrteyPoSG7Ruj3FSoV0/w4v3L/FLRH/ej3uZqOdyg=;
        b=LsaLevwPiy2iGPitCATJAUiD78mKdSXjEWwxnYRPyArukX/546ZPlAVgpd64YQ/Vz8
         CimilFbUE2IC/PePLL0IAk7JaBcJQ450M322LnwC8RltQOlCvnxtwXLVMMG08WCS9Y1x
         +Zq9cOBbnQFjv0j015FGkFnMvNnFOsXe2Fk4gc40TaHO/3bbaWKqro9ieg2h/gLdwKub
         URxsCaUWPzPo2dOWxSC2Rx8ErsSvB/LkKlpbd++psZJcmiwp6eVowsIPSWHhImYZVVbA
         bxakW5DeOAM72Q3QKXsCyhDYsKf15xehPNkVLiMGRcVQu9Z28FzgOvhZMb95ZSHnOWYB
         kYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795342685; x=1795947485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=99rrteyPoSG7Ruj3FSoV0/w4v3L/FLRH/ej3uZqOdyg=;
        b=WsdgamxFnsaol/8/WzFrBBI/NiBUXIaYjgBMLwpKJgGEraDLFvU4jFR9tuMW8Du1U7
         VA/HAbjI3Zp+Ri3dioh9RE8mEdAw2tzDQqmmi3j9XymukYb9mY4AFMvsAFrHDZT4Lufd
         Y52gYLHgfzOfV+Ms7qMiTW989dWlNzKp7labNL9qErLQciAtM0sduS09wI2N7W5QXHza
         H/+RlIew5KXybQUlt4DP8MaGUPQ/YvSFcS+6BtPS1MFff4Y26Ot1O1bC3x1Kz7xMOJ02
         aSl111IWFnKETh1Bf7MX4eLk6Y8E/m7HikQKauC97Qp/6qIllI/4lChSxOZcMMT3YCnN
         MQow==
X-Forwarded-Encrypted: i=1; AL+hErFuEJE6SakRHQnqGPMpAn/BXOgLQWQVKVE9DuqoDeIVNMYv1DBhpISxYmjNf0kUXhb72CwTUJX+qDqVE7M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zCxqfgaIywf/gCb+iJWJuh2o4vCcKJhjfDz8stvpcjjs7gJtR
	JH6ocvJXAiKZMUMfdpSwZKII/sgbA/XmuHw5OTMlbig+z4+vUT+JYjxA
X-Gm-Gg: AZFdTZf8Q7gZolvxX1ZkUJt9lafgn/NVp63aVTEGkatAKDIGWHxG7qXMr5xT6mFaQkU
	9zUJGQ7dlX5dAQUjey1DH3FNZ7XYIYYfiPHdFAxs/0qFQHlwtLmv4ySAhp8sthM9OAD1rvY2aBF
	siDBF1Uefq4BnJ1BN6a2xyLv/ZtfsoH4Uxn5I8vOExH7GL9+2gkYwvHQUATrPUShhWCIMlSZ8EC
	W/L7AZm60KpFx/tvgs8bfJlEl9oIaS4ujw9OW/VewHGhtQQsn1LRAGlIgIPRBNgdom/kiEUxJNv
	V/0uxfMW94NLsD9J46IijyZeWmsagUpiR0jWlco+ySLPtiVLdy/laDQb1agRsyJ7Wg7mooYF8GO
	UrCb5fAFE/MFkNZII5eJ8G4jFXEQOFEi+yT1LX6TNBOoJnCCGxZvrJH/lb194tzsFprKSBcDpLA
	Dgs8mcEPOjcMDrrDC111JzoI0VOwr4zgeP0adIbjWh4UBJ+dqqAMRW1LTX9+InDgBUltGwjKTBF
	8PR3aIZD7Bx3b+tXJhwDXmZh3ByujnoXptBGsF3ggKnn/TP9Fx/JW4Mps/DITblpO2XggAa/L3Z
	CNW9I0rzuYGeq/Kh8rdqscj+p2s1ugeZZTZAloZlvx3SegbsnQc=
X-Received: by 2002:a17:90b:4ec4:b0:3ac:7116:434a with SMTP id 98e67ed59e1d1-3b41c900858mr6907329a91.15.1795342684858;
        Sun, 22 Nov 2026 02:18:04 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm14953787a91.17.2026.11.22.02.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:18:04 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	robh@kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v2 0/2] ARM: dts: bcm2835: replace deprecated LED fragment
Date: Sun, 22 Nov 2026 04:17:57 -0600
Message-ID: <20261122101759.206056-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122095225.200916-1-artem122novak@gmail.com>
References: <20261122095225.200916-1-artem122novak@gmail.com>
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

The Raspberry Pi Zero and Model B device trees include the deprecated
bcm283x-rpi-led-deprecated.dtsi fragment to define their ACT LEDs.

Replace the fragment with board-local gpio-leds nodes, preserving the
existing GPIO assignments, polarity, default state, and heartbeat
trigger.

Restore the leds and led_act labels to preserve the device tree
symbols used by overlays.

Changes in v2:

Restore the leds and led_act labels on both boards to preserve
overlay compatibility.

&
 
Add commit descriptions explaining the purpose of the changes.


Artem Novak (2):
  ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi
    Zero
  ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi
    Model B

 arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts    | 14 +++++++++++---
 arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts | 14 +++++++++++---
 2 files changed, 22 insertions(+), 6 deletions(-)

-- 
2.56.1

