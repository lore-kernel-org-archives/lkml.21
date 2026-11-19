Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115052;
	b=xw5qTNAt6VNgidmZKjPVDdMcWTd3YLAw87SZI2hWnE7y01C0peEmFE5maS+wa+UJGowH
	 yjlYPu1hBarMOaWH3nuaXZrFZgG+uVgqHp8catojaIkpid/UuCkI0vkhDTSGNPVcmvkRG
	 2GhLmMmEwIiVL5T3U+MXNd+w/+6SjHOzCGzhtuyOR3/WPYN8uCuFALcYHk8YQyeHpsNLa
	 FkfFB6W6hv+rEXCHI9SLxTkFKfBTensh8iQbqji1XBXjoHgjEkQiU3WUxbwERuwxVrqmV
	 ra0OU0dJ3lx+MRJqMhe/J4sM+SEDZXVzDqfCTp6mIrngl5QD6RfqzFFzHq0gLyFiIeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115052;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Yh/+MQvK1b1bcv68JYPLNZYWga4ugttJPubbV8w+EUI=;
	b=Xos1IMtcuO/NKBf5hb7z1bvkQB5UmCOAjxOfAIoB+WYe6oUmvTTae9TOx9NR8Nt8rHWO
	 uwdf/XSWjbQp+LujRG5UIyuSr3aM6pflJFpQf90ysDcQbLYXvHleOIzGuX932uNaKH0ZF
	 8j0z50PNGYCFVhvJpbYJz9dE2BpipWPHc2hsMXppeh2KL/uOuZblEdkBXgdGtqtrpSVar
	 4gwk1c15yI1eoH34tTJdxNvOGHoiaAo4utYGiAGV6RW0ZJOe8WnkYCtfgbw5GyFIPadnn
	 vf8dyGDPBnoXcpoOl5hNQ9tH8Hd96yjQwObnFDZ0Fj5ryXnvn6k28wWSOKK4oxa6paw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OgguoImt;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0C760A2627
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B0C760A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OgguoImt
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b413d04c93so100452a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:04:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115051; x=1795719851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yh/+MQvK1b1bcv68JYPLNZYWga4ugttJPubbV8w+EUI=;
        b=EclB6FkFI2n0kWYXAdIGph+23QjzygNxDU7cQeamhWTMRPxglmuBbwbvQ9rp2LTmxk
         t2fvETWY2R9G9cMwnAwU6naiUJAqSIbFTig2gKGn5xmK5XE7WUiNR24rkdfgBP7/BEGJ
         w8sU7X+VriAKXuyX3YH1TGmFGacUySsx/oKXPawf9o7udzuj3or3xfl8N9oZxpb+hkbk
         LqtZPHrCtx+yBAVqnin1bev7BLrfwe0CbMsAuZNpLcEvopnFs7dSAg+nqBdbHThCJ5g4
         dsSoj0eocx3WI5qahr2sQPy0bI1LBTIaCsyWPLRUFTWUe26GVtEtzjrCp3tiF/60vF/2
         3rFw==
X-Forwarded-Encrypted: i=1; AL+hErFzGB5OZ2a96aXFXfv/MxQRXvN1h5X6PYHPy2dMA0+2R6EtiqkE5GIH9RY62PYrQIvRzZ1zRCBDDpWWKvU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hNcH1SqsKFKjJVKX7k4u+wQCeMUZ/FvpeCFfDlUan4nROBjxl
	NYWEvCpf+1D8ysz+xVE2x6qKtjQtKNCh9EVS0tFvEiVqn2mrLDVrpbzJ8vyEmZjYkNdrtzgVNMI
	gnNGPt6bzqqN1ipSB09yWJ3GynjWsDiYRD0F8OPagrw2qJw60I/8BBdMClHbQrZr1Ox88WxWs+a
	EQHA8oMvreh0k4f4jgaJLdU7wEsCcqd+tOtykjvPJ5M/7ApCAitAkJcO+2yosqeIXzjoTSyn06x
	pJC3wSedTirdVprdPxU4tAn
X-Gm-Gg: AZFdTZcq9B14SUT7f+/YsDHiFl1+LiGX7kyZ20fDJK0v7DTE/bk+vflcIGmwcg9nXnc
	BwIzznPSdJSbX7R6zYJfnzqaYGUlZ00M+nj9o+Z12/ootZEhpGBeIFHbbMxcGjw1NX78Be+FVWh
	7I677V4hS9bg3tgRdYPv7vmMFUmQ/spqCL0AH/ZjMH9pmkp2oBwiWwZWD4qL18fxRcelc9jcO+3
	/geya5cHDvcPcVUCv7dQ+au0dGgL2R9tt76Dg+WJDErvwIAGE5Up5J9wjWk7X5liqREUp8S0o9Q
	6mIjyvTS4M+um3C/7UNWlajD7EAJ4MTRymaHsk1gK1dNu9pb/rH1C98lpTlSkkvjbMH/KNa1TNO
	AW04m4JSh9f37js4VuQizet9m9Mo9bUpumKmoTnDs24JfeT20CfYrb6bNa+wrKEE5XgWEqJ+GoA
	bfQBILmmyIoq1eOknrpL8Zm33Ezu+sZNRnIYAxpL+i
X-Received: by 2002:a17:90b:3a45:b0:3ac:4e18:2390 with SMTP id 98e67ed59e1d1-3b41c8528f4mr313480a91.7.1795115050940;
        Thu, 19 Nov 2026 11:04:10 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b40625d66bsm1519532a91.4.2026.11.19.11.04.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 11:04:10 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495dd0f07eso20487885a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795115050; x=1795719850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yh/+MQvK1b1bcv68JYPLNZYWga4ugttJPubbV8w+EUI=;
        b=OgguoImt96GqAc00P8DkMK+9kYQkF97l1sp8A1Xgt1A7JcSmxhMHe47k98O6Ucq1bv
         ppbdaw+dgt+p6hnecuLY3XVmKcWrWoi9/jJQYKbe1Um3ZKlWPx5+Jdzt6Jkgaqy0KvKc
         vcwFydWzwUcdOoVgvxGsIitfsdbh4mw+AfGdU=
X-Forwarded-Encrypted: i=1; AL+hErG68L5pQRobiKxHupXntoHZXyZN1bSw3q6j7L0yyLWdn69B3VsijKRtmJrpmRVhK6Jd5cAnVH2dYeAec+0=@vger.kernel.org
X-Received: by 2002:a05:620a:63ca:b0:93f:3bb5:5452 with SMTP id af79cd13be357-949ba99c7d9mr76858085a.15.1795115049610;
        Thu, 19 Nov 2026 11:04:09 -0800 (PST)
X-Received: by 2002:a05:620a:63ca:b0:93f:3bb5:5452 with SMTP id af79cd13be357-949ba99c7d9mr76851985a.15.1795115048931;
        Thu, 19 Nov 2026 11:04:08 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f7cf3sm24063285a.31.2026.11.19.11.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:04:08 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v7 3/6] net: dsa: b53: clear stale state when creating an ARL entry
Date: Thu, 19 Nov 2026 11:03:45 -0800
Message-ID: <20261119190348.2317702-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119190348.2317702-1-florian.fainelli@broadcom.com>
References: <20261119190348.2317702-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

When an ARL lookup does not find the requested MAC and VID, b53_arl_read()
returns the first free bin index but leaves the entry populated with the
last bin examined. The multicast add path then ORs the requested port into
that unrelated entry's forwarding bitmap, potentially forwarding packets
to ports which are not members of the multicast group.

Clear the entry before creating a new one. Also return without writing
anything when deleting an entry which is not present, instead of writing
back stale bin contents. The return value for that case is unchanged (0).

Fixes: 5d65b64a3d97 ("net: dsa: b53: Add support for MDB")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 1f5776dfaae2..dac6013f8fe2 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -2055,9 +2055,13 @@ static int b53_arl_op(struct b53_device *dev, int op, int port,
 			addr, vid);
 		return is_valid ? ret : 0;
 	case -ENOENT:
+		if (!is_valid)
+			return 0;
+
 		/* We could not find a matching MAC, so reset to a new entry */
 		dev_dbg(dev->dev, "{%pM,%.4d} not found, using idx: %d\n",
 			addr, vid, idx);
+		memset(&ent, 0, sizeof(ent));
 		break;
 	default:
 		dev_dbg(dev->dev, "{%pM,%.4d} found, using idx: %d\n",
-- 
2.53.0

