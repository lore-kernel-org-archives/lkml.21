Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032831;
	b=RNqopDA14q0MuN8uBuHSEFhYuJeklWiU6Dfpj22fREiXkyTsA72xNu7o8rfiGyU2jtvU
	 QGRF/lrvkcMeEYQYhmj0ufAsuXAl2vdsCB/J++qv7nyCvP9vmMB6rspmwxGI4v+sOWhGW
	 X5k39weJZAS1UJGDt7HTa7i9jnMPyfkOJDUMgpfR/h8c1k19eTPHmLp0CbVr9WHoD5Nco
	 6bxsB1vzDlU5tsNuP6J0AcBnE8zup5nDQr7TxG7CKSJ94UciDDFq0FGhB2LZqrJ0Xps0z
	 hBB9oRtGq59kTo0/O0xFnXmOKfu5Gveka+Dz88wxCBkptHFX/KoxW7sBCq7ml3ji4Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032831;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=aTzD2aWzK4y106Q4turWhvgJUGfskZNqD81yrb/wDlI=;
	b=p/xS9HA2yvYS2FnqZ+2aaSFrFUd+bDc7Gx7Mc6nD8lmFRJqM5DoYnY114I8dfGeo6N/C
	 v8wtlmKrdO+krDlJPTna4zhjRD9s+lVQWA/2ljnnvYvHMudppRl5QAdChN7JdNZCqxNzj
	 xkk1H2gQ/cUKJBulQd5Q78BEI19Ovv+vWAtUKlYanGuTv/uhfw0oC7spc/uYAvCv9YAoj
	 uvTZpciWnsRsPQeQFc8RHI1P1aj8IWjCeDTlvAJz5J/ngs8RTZJSqaGwrxyDbm0wd5CWW
	 EczCT7wtmqd/6cD2WNHd+GZhqgHVwDzukoccQtH3aJYnOPGWdpuJKXOJMKtvaTieHMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EcnMcg+p;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F959606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F959606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EcnMcg+p
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so1232872a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:13:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032831; x=1795637631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aTzD2aWzK4y106Q4turWhvgJUGfskZNqD81yrb/wDlI=;
        b=ojl11uMz8Phw5LvytR9RRkQF9fLKm1E8bNsKzLXKwEbjPLY5mByFRX74hLlLJq4bLu
         Nlj4qZnXTCxW+pI+FA3uDc9AZP6K2BVcrEMYpziNT8sCvdL8jejRefli1mxh++p8G08x
         aBfLyrducXM7isTiUvB82YcoK9X06qSkDboRVEahSPJygarK0HF5OQpuBgH8jlZ8BZ3l
         /kUYiCjAdYA4VpX9pt/OOJDodnK/1PYrkpdLK4ODRotoho89PDsJZruxrE9j/OhgfRHU
         6q+z8EKQZ9xmBQWwkASmiWfCDogExG1MaATu9VT+4gphYiWOaGGiPCZpnDoTucHJc3ue
         g/RA==
X-Forwarded-Encrypted: i=1; AL+hErHBQJGKsm2YLXV2gtr3lS4gHAV5pWmIZvUeGzc8oynzE2AQJcLtVLjEhJt5c7WYGLXrSl+zjOV1cZPtoeI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Wgj08QEp2X/x7pzWSaBeykURYB1LaU2OEsgtpjc/ERn9byalT
	+TNalNhbQ2SiWfNO+MrHl4r8nJyCoU2bZjDbmmzwZnlPmVHDcSpDPnSAh4kwIdcc5k2TshihH7S
	amC4AkG4bGXdYQw/djtBX+16UA44zK0SSQnOzA6u5Aytucx9pRXpQKLKvup4G3Grb0/LPfTzrDn
	3wcMDd6s8U+EBwBolneAWgQWiInDvu3hfRZiYy1F55Hm2E+NGFVlEbYf73XIIdqrTmd2aPbL9yc
	bOTdp4BkMcK/lxllFhRglSX
X-Gm-Gg: AZFdTZesn3JzolmRB2qdd35TfJD82sgINmfZpww5/Wt9tDduWlXwx9LwyEYsyye2Qum
	cxodvMeZja3mdVc1z/EFBA0AbhlmvP94ywp5w8coGbpDUqY11rmNTPjpQu++fAk9D13yX7sX3C/
	/8vq4tR7UGzwSDWpqxjonrawk1B/dChe5tAseBSolAyzY+BJ5qAn/NxbXanS5/VeEsMo22Jz2xp
	EuVWkgU2sBFTwpq33Cpk8tjbna+2QDqW4pFXrGU3g0v28G1KLw94FrsVVRI5fFMomTUIY6LJauo
	kdG0dqN+k7cCVXeXMqrOB6poiLJ2pwmDUl0eMRsjKsPjX/kNVdP855LmVTAN8xjIAILyQ8TEAP6
	Wr3sJuPRzzji4atV3XXRFXIV620efBU+Swx62Yp+tFiChuTffRJhHkx4q/ygsGKAinrEf8ZD1Is
	pqx5uioP2urTwIpMeles6CCE3eN2+96/17y0LNTrlz
X-Received: by 2002:a17:90b:53cf:b0:3a8:6045:5a19 with SMTP id 98e67ed59e1d1-3b3d07a9f82mr3661470a91.37.1795032830907;
        Wed, 18 Nov 2026 12:13:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3f6a75811sm380216a91.2.2026.11.18.12.13.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:13:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55d2c5f10ddso29334051cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795032829; x=1795637629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aTzD2aWzK4y106Q4turWhvgJUGfskZNqD81yrb/wDlI=;
        b=EcnMcg+pj4DD81piCV7cmJQrVefYzvFVLEk4AkTXVzEMWCyqPt+KqltiIdTrmmUrpv
         Xeh+vD355s8wizgxcwUZVm5HWxnXJK/xOtpWJ3zwd9w3YEP2Vo+A/1TVif4Unh9LBDOz
         cwE0zMKljtC9NbA614J0iUSO3AgbackW9Wj3I=
X-Forwarded-Encrypted: i=1; AL+hErGUG9kYSyom1IlFoZ8F0BLd9FWsvSsRqE4qdHKyBT17AJPE/e2B9R8SuKZrag+fEK/Oz4eHB+dORwfwihk=@vger.kernel.org
X-Received: by 2002:a05:622a:4cc9:b0:55d:34ae:98d with SMTP id d75a77b69052e-55d5a36e1famr59604241cf.10.1795032829395;
        Wed, 18 Nov 2026 12:13:49 -0800 (PST)
X-Received: by 2002:a05:622a:4cc9:b0:55d:34ae:98d with SMTP id d75a77b69052e-55d5a36e1famr59603571cf.10.1795032828766;
        Wed, 18 Nov 2026 12:13:48 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66c2a5a2sm7675091cf.21.2026.11.18.12.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:13:48 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Toshiaki Makita <toshiaki.makita1@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Subject: [PATCH net 0/4] netfilter: flowtable: Preliminary fixes
Date: Wed, 18 Nov 2026 12:12:46 -0800
Message-ID: <20261118201250.2075007-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This patch series was created based upon the Sashiko review of the
Broadcom Flow Accelerator support:

https://lore.kernel.org/all/20261116222519.1416501-1-florian.fainelli@broadcom.com/

These changes were not encountered in real world testing but appear to
be valid. Test cases were added to ensure there are no regressions
moving forward.

Florian Fainelli (4):
  netfilter: flowtable: do not queue offload work after DESTROY
  netfilter: flowtable: restore the GRE conntrack timeout on teardown
  selftests: netfilter: check hardware offload work after DESTROY
  selftests: netfilter: check the GRE timeout after flowtable teardown

 net/netfilter/nf_flow_table_core.c            |  12 ++
 net/netfilter/nf_flow_table_offload.c         |  13 ++
 .../testing/selftests/net/netfilter/Makefile  |   2 +
 tools/testing/selftests/net/netfilter/config  |   4 +
 .../net/netfilter/nft_flowtable_gre.sh        | 137 +++++++++++++++
 .../net/netfilter/nft_flowtable_hw_destroy.sh | 162 ++++++++++++++++++
 6 files changed, 330 insertions(+)
 create mode 100755 tools/testing/selftests/net/netfilter/nft_flowtable_gre.sh
 create mode 100755 tools/testing/selftests/net/netfilter/nft_flowtable_hw_destroy.sh

-- 
2.53.0

