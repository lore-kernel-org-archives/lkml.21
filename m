Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943951;
	b=RFNqYuG+KsU5Ras9cVN4BRH5uYqalTvoJIMB7NGC7L3G1VmO/Z48UY/z2ucirkvLMWNn
	 IhkQ63G8JZLpif70li8jd64Pd//Q3Zp44T5hmCRAst9FvpIP0cps/l/wW/TJXgqmo0Vip
	 dPiRe6FO2vlurL5+ZGe75kt1SKRTLFJ8spC+rCrksJ76FZaHEUpNJ/yiKxlEuYK17nRBA
	 LP6XiynGOWG50tFJhILj1i5X4IrEJ6MZtem0zRowFM1qELFKFjkQY4g7Ckv9WYEFbA9F+
	 BD56aFEJLAbi53T2UmCpNUd1fINhhC/7l6lccTfO7zXRb7+nLp75cAZIdrevOzRlMrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aFPoSxt0aWUwwqX5xUF8SwWRu98kYFqbtHO45/HLvLo=;
	b=5H4xXYq6ZFLIReUUMNHDkrK/CgQxrV8k4DMYVBTzaAawRtTNQiNTrwwBbHtvvjg9cSd5
	 elUu5G0a4nY0Y16Md32V2Dbk4UIFwa0qhMSe7FPiR7TS93jf+b0FfPncO2BPUDXKn6RCt
	 OguDwdooJCvTgyc7Mi2/XbCnrk49rWYjSH5Z7Kg7AvdTkdmsc2URyQtHFiq0mF1Np31Kl
	 9DLBOMt6rPBdZK6Xf5hHN6NkFxc5ZAjLt0CuFYw+0h4LvxvqiwCCcDP0ULZ5ETnImkgHS
	 NTmX6Ht0/ACSHA6PbqILKYb+VS5qBw02lr3RBUkqFczZ7/yQby7+1VHfRpkyWkLUBiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wgsy+YBE;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C486606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C486606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wgsy+YBE
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36dbde64409so506395eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943950; x=1795548750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aFPoSxt0aWUwwqX5xUF8SwWRu98kYFqbtHO45/HLvLo=;
        b=wgsy+YBERwE8HaMtCH3zQhnnpciwtzZQP80JZzZBJmv4J5oZOK2jGXvtwO8otIBVu7
         48Ht2WBjJy+TE+NPdtHH8/kI8rcXsp1iKMjxdqeRHebP3uiq2VG8QZ2yvs8u/moOA2X0
         eQO1AIh21ELdvzeca8Ld0lJB27M2qQYJb527ZgkSkUYRtRCgw6O847EpKhHyvlkmmHeS
         hQePV0RNVl+dH7YG1CA9qxQo6LTNYZfajEqXkxxooWzXz+pPXs1zkhVHILC/M1q9ZEwa
         R0891SpFrMdpYOe2pKuLbYSRRbS5VnYddB0FS0LX/xYkyFcgDoaQHvv7yZS+MHgyWKhG
         w18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943950; x=1795548750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aFPoSxt0aWUwwqX5xUF8SwWRu98kYFqbtHO45/HLvLo=;
        b=qs5bBJz9zOxZMlVwuVwnH4gdQ496tzHS404CB4OU/8Jca1n1FOBFHyjIEwErC/dnH9
         wINCXNMDCwqxHw70W7s1ow4TesF48v4p89U7MlZwDdbhRNAGYBJqdeuQiX6jUZ8s6CcZ
         IfChFg2g1VOh8LMKQa4nPFXiJST0T1dg0EpN5dpd606Uq1HQUyRuiEwEGIw01TBl9amG
         r1p6ZQp8mKXDgejebS4HuQwCwBaarxdl9uOau4TJsmP0whfE2z4G5wKMgo15trZn+njK
         ggOfURy8ot1D0FNOynPFQeDYzCcGZPgKACqlMNqaFBAoa1EHmMbaaRp/GH5mseD6I2Ml
         87jg==
X-Forwarded-Encrypted: i=1; AL+hErGyRjJCP46BVqZur/eyCLjQHJyogize7BTqsyZS1oLtvtCILKqME/mlBIVE8RKfRdvIOoslUKNyPVhees4=@vger.kernel.org
X-Gm-Message-State: APuU4Z993w6HG2LeHnD5K1iLtOOlkgWwJ3OXqnxQ9bO0VKYiuu7y0Mtw
	kI2QJ5IFHH2/3dkAF/9cUiS0uOQxvio/1UyjvyQ/vA/Bu8alaw1X3L7k
X-Gm-Gg: AZFdTZcxHn7NrDXM9YCaj0FUxbdhlBNZKtQzwOZrwgp+9Tk5FUB7WHee7g4IFEkV1DS
	2ZyeU6ydkiGNTxi7PM7RKPTeM0QblqejDjDCIUqCqPry1yGF3HvcnHJkviRM1QixyBje49992/8
	bfxcpgoa7LHi1nHh+ea/ywdaPcVpIA62sCpP5iqxT2Xpd6RDSbuR3ZFDlmMYKbkk5L6eyGN3yh6
	08YuURNHzT/Co8+5ojrxIB/FNT3xdtW9/lZ2usOkTS/y8OJe6r0yuN9jD/5+jDCkAfKO16q7Vq7
	4rSuVX1zzxwIzNrS6uNStIgH5Nt9FtO+usaCOOJJcnMid/XuLpnT2WdU98fm3GBKiJdIu8zES9V
	+vLJLx9h9ndyZ8HSzvMJpCn+NPF5ky88+cSsczvtHmSlvYDV8pAz2aLiFtEFmTAh340Kju/sUC/
	nvuIWDphwqOgWgEyiWlEEwTfgk847xoZsMQ63oVyJeYmIubQAEGnqT3nTXE9meybYT5VFf09diU
	P+XGkpEK/rwjqVwWfsqRQQTzkKTKOVtf0wzvucFJiGP2Nr5WlgmpUm0Jpj4RjmMeorbgbexf6jU
	2DZVCHb+
X-Received: by 2002:a05:7300:2387:b0:381:2114:99d0 with SMTP id 5a478bee46e88-3828181007amr456120eec.39.1794943950264;
        Tue, 17 Nov 2026 11:32:30 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm173376eec.5.2026.11.17.11.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:32:29 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net v3 02/10] net: au1000: clear all-multicast mode when restoring hash filtering
Date: Tue, 17 Nov 2026 11:32:15 -0800
Message-ID: <20261117193223.2795612-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117193223.2795612-1-f.fainelli@gmail.com>
References: <20261117193223.2795612-1-f.fainelli@gmail.com>
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

MAC_PASS_ALL_MULTI remains set after IFF_ALLMULTI is cleared or the
multicast list shrinks below the filter limit. Clear it when programming
the selective multicast hash so unwanted multicast traffic is filtered
again.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index cd25248f4e3a..58bc8e1b539d 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -1042,7 +1042,7 @@ static void au1000_multicast_list(struct net_device *dev)
 					(long *)mc_filter);
 		writel(mc_filter[1], &aup->mac->multi_hash_high);
 		writel(mc_filter[0], &aup->mac->multi_hash_low);
-		reg &= ~MAC_PROMISCUOUS;
+		reg &= ~(MAC_PROMISCUOUS | MAC_PASS_ALL_MULTI);
 		reg |= MAC_HASH_MODE;
 	}
 	writel(reg, &aup->mac->control);
-- 
2.53.0

