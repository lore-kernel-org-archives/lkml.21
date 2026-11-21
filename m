Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371346;
	b=0Pb0tD/CxrumJF8Zz66Zs6BS2fPKlWAIFMxEREeYq+nvg+UMfKeEoIn8WNQ8IcLCpjWq
	 c3gEu5SwsGL3nBwu8DK9Hw0k5704twtKIfTJDiMuSNuWX4YTx1mj69ciEo89f+WRwKu+E
	 zRrXG+irAqRIzsa4VOzi16bU/6ds82TVJqWabGRqxEPRJVqYO1jXRFxfZ1l6Do7zlwJzf
	 TbZ8dh70OA0F1VGwKIH+LW8vtV7m8cATAadcfOPRIHYysZod4X0esJAFCuR7aVnZNABOo
	 6VXRhq4fOtGDzcn1leZOnxR3wvoWQuZHjlqQcLD0hk51HaBuTSKElbJ36NgDSpXospA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371346;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id;
	bh=OAeEfc82oXr0CmPDTHNmwm//64q24Btd+FEWIEZhuNk=;
	b=ZihTsdTv04yiMP+9ePdS2/gt72dbmetYDAmnsq0UCv9FiBp+MpsN7qpJGgU4fva+O9YI
	 tIsfG5xflCDEqao8b/EZ+wlst/CCb8zBUTFAEJeGLVeR18AKXgJmoDzccSVDdDMo6G5FQ
	 8Xv/pzo1K0E78Z1TlhZnmvzHZ5g1z6mjxDWRlDRKTVJubQgi/doxZH8c3GIHbEvL4Khzx
	 dZopkObkK5kIGCqrS2reQ8XQ9EOFfWzmvV7r6SHWDvpOxKkyW9oiTfowAtBK5fP16eM87
	 hvDVn+EIQg9sacf2jbaK29MHPj3LHpj6SEqtYFe9WMLtnOS0keLRl0Fip/NS646ZX7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yrv+ueBU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A055606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yrv+ueBU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6411F000C4;
	Sun, 22 Nov 2026 18:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795371345;
	bh=OAeEfc82oXr0CmPDTHNmwm//64q24Btd+FEWIEZhuNk=;
	h=From:To:Cc:Subject:Date;
	b=Yrv+ueBUrRL0wroH9Wls97d6Nba9QlwdAkR+sOrykiM9OQFjuEz7v158GXGpQmo/i
	 8jcD5fWYwE8eGWtelNFkKNocIPzn9iCqpDDRm964a+vRCeSrSjMf822i3HEFM/tK4U
	 F3qylY0sSq6d8Ubzu9BStrMyeDYh47jPbhjKHvMvmcI2bhZoWkAaWuZJVcE0LtnEMV
	 Rg/H5ubmpjdqcVqo0o2BVMtC2Mtr9dE2BqwRi7e+bWtmHI9hCY3DSVXF/SE8R5KOGS
	 Jk9P56eThrO68Yb/w7Cww/PCXNlMZwrjSD3LSLmfJxL2gp9v+H4uM4FL8p1vJ43Siq
	 R4Mra9xlNUCig==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id B669F346436F; Sat, 21 Nov 2026 12:29:38 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] regulator fixes for v7.4-rc3
Date: Sat, 21 Nov 2026 12:28:40 +0000
Message-Id: <20261121122938.B669F346436F@traversing.sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The following changes since commit aebb7274476403040d582c61478df8f4a7bf9cd3:

  Linux 7.4-rc3 (2026-11-15 14:30:11 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v7.4-rc3

for you to fetch changes up to b544ca82abb46f2f870d32b3d7cae6ff9d9d1311:

  regulator: mt6363: Serialize BUCK_TOP key access (2026-11-19 18:18:50 +0000)

----------------------------------------------------------------
regulator: Fixes for v7.4

A few fairly routine fixes for device specific issues, incorrect
information about the hardware and one case where some of the hardware
register access needs more serialisation.

----------------------------------------------------------------
Alexandre Mergnat (1):
      regulator: mt6363: Serialize BUCK_TOP key access

Ben Grisdale (1):
      regulator: tps65132: Fix incorrect bits for VNEG/VPOS discharge

Jernej Skrabec (1):
      regulator: axp20x: AXP313A: set ramp_delay

 drivers/regulator/axp20x-regulator.c   | 12 ++++----
 drivers/regulator/mt6363-regulator.c   | 53 ++++++++++++++++++++--------------
 drivers/regulator/tps65132-regulator.c |  4 +--
 3 files changed, 39 insertions(+), 30 deletions(-)
