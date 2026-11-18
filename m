Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998028;
	b=t/+JiDkO2ZME8AnHPNnahF1dRT95zVRp4jDCSuaqHRukyBXF7NHIRkjb1Q6d3Em7F7ts
	 eUIDLv9M/VIYwrBadVH68eNwmAlUjPvBwAlvw+Pu7gkeEFto8eYbD7qQFW0ah2qLRyzQG
	 BSkY+seoP1wgaiZ0IuC6E5QajIaKsnJ68ETpRSCAgLb7FUT5foT1sZflVY4r554otjDTL
	 TwGYktzLW+oPTsmqIBTmho75S+gIJ3gudLRq55unMwoTkBC1H87TcPK8hLjH+pECbUKAZ
	 SuA7nCEDX08iGL2BLpEocAzn2l+qlGpULJtVL/0b+fFcKAr8kBkpRkNVLVUn247gdQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=eHftBICfL5lf7+1UD3fD4oeS4Rb6SDVondnJse/gAGE=;
	b=Bv6BV294n6YMki7TRAWvsger9IpMfTrzzH+nbCf3N287K1MdAD+OrWhfryBkQFiLL7xz
	 KNh64XRmsl+mc8O9UZ0fGUispbyC40PDoI7nGVFWUeCWPf4Am1H/r3YbVMFA9By/2Hhjp
	 VfgxzfiB+kfoR39xkuMgx8hRUR4oASLcW8U1zBw1EEAv0zk200BXQTI73f63BS3Ws6PV6
	 woztMaJ5WK5S5odD3LrWM9dWG9cJLjJoeOer9zA1o4xFT+RQxYLx9CD1Mef2DWsK54lBL
	 NA0DOeofelwJjcl6cfGf/9C3pQChTKnUYZWJ0KsDrBPetxS5Y8xOMFOMwyMG7zZ7dDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K1opnPCT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.131
Received: from mail-oo2-f3.google.com (mail-oo2-f3.google.com [74.125.231.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F0A606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42F0A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K1opnPCT
Received: by mail-oo2-f3.google.com with SMTP id 46e09a7af769-8459f7bc7c0so287711a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:33:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794998027; cv=none;
        d=google.com; s=arc-20260327;
        b=kQ2yGiAk8R5ntroI1x6MxqA8zo0bEZOx9SW0hJ0022TFDm7u4fA2mkHiQD8vwtFYrf
         Wqj4ZbQXKNwO+CDNlqRHSLMs2LcX6EubGWLnIztSx6vGZtzmw706JCCFCO1kPo2aFUGD
         su0MLCItxHl3fHdysRNmlrjUPtUykQLjLm8WHPp30XpvLKZT+wSfOvDzayoQXbPM39qP
         S/MamDs0e/cJhfSdSudxS+ZUqIXINFZu3LSiIVomCo95tZgMaIDFPWY8KVShh/23JKa3
         oKDilOmr/hz7sY2imDiaFPT1HVc4+IHv6gYdEh8CR8t9uec4WfB11ev/zfiCAfMu1WJI
         gzVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=eHftBICfL5lf7+1UD3fD4oeS4Rb6SDVondnJse/gAGE=;
        fh=NOvme62S346fAe6xIKrOzojr7fVXhITGjmQdoLOgrU8=;
        b=pXwms41spPMzXckfZe21HV6XtwMs2T+gFhfXR+ynzUrZs4lY4zg4mccSEvLD4kjoJK
         GChJ/zxbAx60bgC11WoARh63zai9HxMlJSYNm28sxBQv6rqLo1GSi8kdXFeh6Os+vCjb
         CoRdqJrWeHLtmYn0SraloTLULwc40w2tW45ON32YAA6frvT1z3A3xDGn7n5koof15vQn
         5bM6wLHMl+TAfHbriHWRSy2TFGy1CskDJANYC1OAUVdClNRegr6QyJAlGQyDmWTwlH2b
         ZEkoB/fEAuuKiuaqPUteMhs7EUu1m5OZKbP1+1kHRsG4s3UeiLVSgAKapYvhVzI/LZJI
         jKIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998027; x=1795602827; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eHftBICfL5lf7+1UD3fD4oeS4Rb6SDVondnJse/gAGE=;
        b=K1opnPCTe+6EenhPUqp2uPc4X1Et54jZcWV0TJxbKlCTOz8aM16/+ZLVcJXnC02J0G
         4AvpeL8VfJqh6abrfl6g9MQjL8y5qYe0gMgi1Rz6L2wErC69LdGajgvXljm9P8SVIbIb
         jWuuTUv3Lg3MagKSswUq7ZDHzNZC5mE8PxopfB7WmdeMkNFlQtZPB3eWf+ms6JcgrTwd
         yUPcIk6n5pwlX5+8odCWTnYh4XxMu5VT5YxpA8uMngtcQLi9m+9zxoavJyPlwX8LuWGG
         PQKXOdCQ5xQri4LwPcQvhUHN463PfN1FdLzK+uFHUxtu+HVL5sAGyGH0o74zWhVHnMUp
         pSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998027; x=1795602827;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eHftBICfL5lf7+1UD3fD4oeS4Rb6SDVondnJse/gAGE=;
        b=XsvPAcmZZdWqk6rCl6a7LG+N99PsMQZuvmvz5NUbG8zFk3cDl8jbpLXV5eIOU/7XwG
         Zr8H7RACoWyKVgMybp05E8y7GlxbZ7yo19YG1ljjYazZdeYLTbWeYGqiAmbz4fi9ie1Q
         HM9xM/yNo+z5qVYj3ObQhsdXylM+BTInHGJUefzITnJXR88LU7ufKA6XemyQaFgkuWr0
         mg4/w971WD85kRsy1irD3SQ5XiCi+1tmLypZ3YTPSYdawdEaAIulDmBJezJsfYMXo//+
         A+wNRZ5rszq7e9jNp1gu000d92no6NbU5gCwxw6+xAzpFqjvB3WGypi5bjZseKKh6yp4
         fuaA==
X-Forwarded-Encrypted: i=1; AL+hErEFOGyCHCKn/ab+7mHOexJE6A1NVyOhw6G0o697y6M8sJ7lj1hPPanLaW8wpXf3kYtfAMdcEHp72XQrWkQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9k8w0xF+fGrePuIU2QXUXFBFmHjTf/K1g0I1yGODShdls7gNE0
	YCUqitsVP09kkd/FjzAJLVzLspx/ML2cSCvAxvm/sPvZrZQxAf/WW8yGLoaUAPsjewMzJPxBL3S
	g78o8Vt70zHmjk9qt/aA1NE7FMwq45Sg=
X-Gm-Gg: AYBFou38Yqs8Q7VhWLW4yZG2MWzU46OIfEwHan309eiRsUk0jXnCQVcmNgnHVwV93T3
	HJkZ38IhY/qAjyMP4roq1Qy/LobnE94427PX/KjJCCFo8I3C3XkxtXxZlaE8qyChheD+ZvhxzfC
	VyqPYEXWncGM+SaA6ukWtG/mS5A79s8133Ol/kEjUN06xa37+IEJ/AcrqWRpqCLcmE6OSOofRYr
	QZjnF//bRc/DPFYQbMtzu6hcC7QubTUkdzx8uw6KH3037415Iepfcg895n8xUfsZxcTRLYFD/GC
	g4rbzMiqDJwAqNwqATkPkq3nP71An2r+Rj5wG2GN2xj49tb/tGQXQRxtUhtO9I5lciNEaQo3659
	OgxYUhbFthmXbD+bm09/KroiYpTogio9PbotZu+oB95I3NB8BSkEnt4eq/KY=
X-Received: by 2002:a05:6808:518b:b0:55c:127b:b769 with SMTP id
 5614622812f47-5774182a61cmr2545994b6e.32.1794998026934; Wed, 18 Nov 2026
 02:33:46 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 18 Nov 2026 05:33:45 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 18 Nov 2026 05:33:21 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Kimberly Morris <gy770616@gmail.com>
Date: Wed, 18 Nov 2026 05:33:45 -0500
X-Gm-Features: AclHuK_AzINQnGjvOhKKc6IapMLdPZWmmHRI8UP9v6DIWKYZf5qhKJsW_DoCxYc
Message-ID: <CAD-64DdqQ=Vx4BaRn5TXz0g5ZC6rU9+e0o-rouyXzGH=Nv0ubQ@mail.gmail.com>
Subject: [PATCH net 0/2] net: phy: fix timestamping lifetime after probe failure
To: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	richardcochran@gmail.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, w@1wt.eu
Content-Type: text/plain; charset="UTF-8"

Hello,

Following Greg's request for an applyable patch, this series addresses the
automatic PHY probe-failure lifetime path from the earlier report. It does
not rely on the root-only sysfs driver-unbind trigger.

A PHY driver can publish a devres-backed mii_timestamper before its probe
has completed. If a later probe step fails, driver-core cleanup frees the
owner while the phy_device can retain the published timestamping state. A
later generic-PHY fallback can then reach the freed object from
skb_defer_rx_timestamp(). Broadcom BCM54210E/BCM54213PE also leaves a
registered PHC backed by the same freed storage.

Patch 1 restores the timestamping state that existed before phy_probe().
Patch 2 adds the missing managed Broadcom PHC and timestamper cleanup.

I reproduced the first issue on an x86_64 KASAN kernel with a KUnit test
that registers a real mii_bus, phy_device and phy_driver, follows the real
failed-probe and devres cleanup paths, attaches the generic PHY driver, and
passes a non-PTP skb to skb_defer_rx_timestamp(). Before the fix KASAN
reported a slab use-after-free; after the fix the test passed without a
KASAN report.

Tested on:

  - upstream master 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
  - net/main 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5

The submitted series is generated against current upstream master
63fdb511c27afcebce797e3db580b3534ddfa639. I have not tested it on physical
BCM54213PE hardware, and I am not claiming an attacker-controlled probe
failure, privilege escalation, or code execution.

Please let me know if the rollback belongs in individual PHY drivers rather
than phylib core.

Thank you.

Kimberly Morris (2):
  net: phy: restore timestamping state on probe failure
  net: phy: broadcom: release PTP clock with PHY devres

 drivers/net/phy/bcm-phy-ptp.c | 19 +++++++++++++++++++
 drivers/net/phy/phy_device.c  |  5 +++++
 2 files changed, 24 insertions(+)
