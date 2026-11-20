Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174997;
	b=gUH7hMDONCIqX5ZKZ3gwdvpShHxWaTGnzeg4Z9YzGICGmN0jD5Inr7+VZPqPPXVdSLv4
	 uPikxAO6eEIy1O9PIEHFntIPFVfMixpD91BIlkWElO3s0nudrfokT0q2D8OuvOvzn0P5L
	 vzbSQ08cL1ZSxxC/NmuZjdhZ6bFc2x4tAmwVh5AGqxOUyWIYKQWgeqBMaD2DbASwtw5rc
	 zYBdblo9nC6LHkPLinGkuyCr/oIfRjStoZmB1S3larSdJa4odR3wwsHII6P2YM9oyo2RP
	 ZkP96pdrvCbln0KXzEGtVNpPirnCZ/Nlg7iSQSW8EuMIDT1P03Rt3J0uLwa7mjNCB3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=tjGZ/Gq7+UhVAkNckCXeXj9Z4u/UvTe6D1SHPI36wK0=;
	b=l2Ikc27/NeCrIHy+z95EGaBI75/9BQWEYS5rpgLAx2486TUvhi88fpuIlncyHDVJ8yk9
	 kp9K+GnSC6gfuvUR8j6gHUoThEhokp1LvaL07EfcSNpGoC93ODT86QT4FbieVB5M49/7c
	 Hi5ezil8FyjZn/Bl5pxXK8wRfM+4S8GTIdnMrs/rTD4shtPvKD6WBH7Nrmvcnd35yvzW1
	 LVTA0JGBcSOHaLoD8TrhSgqPIrXNjx0v2Q2NxbahJE1bUfJhwtJJCt0v/SZZciQ3YYjbD
	 9CI9jHcKxNQRAmR6ogudY3QP1IDnH7rShmnyg1wUEVnF9L1Ffuc5Ku2dyOP2CSdKByg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=G2GB3A4X;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D70606A330
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5D70606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=G2GB3A4X
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f04bea9a93so3270055ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174996; x=1795779796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tjGZ/Gq7+UhVAkNckCXeXj9Z4u/UvTe6D1SHPI36wK0=;
        b=G2GB3A4XT2sHgkucCKvVEMoFLDNQBBI0S0GC3WumZZGm7n5ci6O9UlEt4yyPkKMDpy
         +NF3Q0KNVqqb4puo8H15Mce8ncBddovBBppKFOADK/pM65lxEsvpWCEszGb27yWZLpcv
         +B88l8zKMTdbVO7/aLEvHWCSgJiwrHj6gLSmmbPgBSjjZ11k0WD0FgS900hGVtXgxbK8
         vws8a5g0yzSUIS1kxzaDI8r1H7rPBEgOLWEkzFI2rVnuZEJWl8sW7uZ9O52ZzPLVrI0x
         eV9i2aruiT0tOSCCbyPYgCYFAhkDCRxqButXozqooXOVwClriZcUAXYy7XrmSgcFWq/S
         dHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174996; x=1795779796;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tjGZ/Gq7+UhVAkNckCXeXj9Z4u/UvTe6D1SHPI36wK0=;
        b=pKm2an8wTPrFHLQdJ8Hsv04rqUBoOO2a+PyyGvZ2OpYJde4czQV4Svg+mkNxtZ4HQ2
         ewLvwfDR/PRQNZPcJQwELGltb9XFmG5F6QMNp9Iqd9AeZlSmNt64cZeCa0e2DD+M9QRK
         xGSV1u8cKfW+BAX7l/84IFOpFR6GGtbdiknkxNdF8lg7CeEgwr6ICpo24Qby0pO6kQgK
         CiN0eAO7KKxevgKHA+5EMUxMECnJ39PfthUNdPACXYsz0Q/npfN7AYyF63Le6fIfbZ4B
         fnOgYQhlbneJwRIGbAO6Ku3AXNZt4xroX7JXuIi7qM4CYUgcz7sdrGkZlwT6v74gs9K0
         k22Q==
X-Forwarded-Encrypted: i=1; AL+hErGmltUnMxGTdunWiXbtvb8wFPyXKwpCGDmUgri5UPAt7Ml7dD1paO12cZGHiZucL4mDr3NS4Gy5pHcsppI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wuPlKF1PGX8KbkSlQGHFv2Fr/MSkEfI+fF3bRMUO4p/WAbn5c
	snkPbDcHcwu4fHbi11iLfbrDpW1XkUiNFbYb95przgHgXnrLrXX3PBUwZE2PXUkD/rk=
X-Gm-Gg: AZFdTZeohab0zmuhFCsPavTTW3OE3iNNX5jivBUSbCjMxVsy/xTX30Se8SR6WKWnTBk
	LT9/bYSdwHiTwnEe570+QddQyZ4yZner9q0sqlA1dR3d4CjlA12CsVYAOl/Zv48wtyqiS1l+n/D
	idvTjaMCr6Tf5WO9YXRKLfXnAfdBfgyNr6HCPxLX38bbTAtPtqcRXPzs1PM5gIcnwJmVRnK13SZ
	LVxknfE6V1zEkx4r8ekGNgSMUKL/OyfwzGnlA9wILFcgUWz/q1hjSBecTunsb3JFMk5b1tqE9+q
	iz2svMjkJffOH7SPeUhZlcoAw7gOl1Hv1diwuXzlKLCSp2n/eKgOqnmlFXDnkJui7hWFEPKCnN5
	5JaSsEa608jDcS1McLSnesbFAfolmk5tlc5UyV0HcwNcBuNVa5ONTRYx9QIgzh0HsWa5QvyaqPA
	Bcb/44ptC9AyyIhyJwakE4wm1amoPSrPmw9UM6mPMqAhQIz1nzF2WtSx1bBh/Q+mOx5JcVuDw0I
	g/MvPtRxqytMLftx3eirik2EQ3TGMic3I4LfA9btHoP5XS/MDnZ30fwk3k9cPlSfFue7lYH3TEE
	5dWLysw+g54e4GVFcvmcTiDttkLKxsnNLzPAgwFaFEgvPizyQDm1sl3tPrVK6mBhrBncEaaabu8
	/eifrAASHEKOAV3iJ835lqlQ2qSVLwC5Kq7H1
X-Received: by 2002:a17:903:2308:b0:2e9:cb4:b345 with SMTP id d9443c01a7336-2f03f264db3mr28740915ad.55.1795174996354;
        Fri, 20 Nov 2026 03:43:16 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120769sm13267975ad.57.2026.11.20.03.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:43:15 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: ching2048@areca.com.tw
Cc: mkp@kernel.org,
	James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thenzl@redhat.com
Subject: Re: [PATCH v2 0/3] scsi: arcmsr: bound adapter-supplied completion indices and message lengths
Date: Fri, 20 Nov 2026 20:43:10 +0900
Message-ID: <20261120114310.3072277-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791792888.git.yhlee@isslab.korea.ac.kr>
References: <cover.1791792888.git.yhlee@isslab.korea.ac.kr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is superseded by v4:
  https://lore.kernel.org/all/20261114033810.549787-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
