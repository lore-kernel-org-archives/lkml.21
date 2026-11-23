Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447988;
	b=QHMm+eyty/0qPYkaeEmSrPrVtKIVem/CLGtZZ4wqw2yei3eSVhQkcvJ34CoMNuDInE3X
	 AKEB3bOm7E008DBpnBIhWbrxV1WsKN5PeWXUmQWOwTjXNDCzwLw8JOx/0DeDypS1NQvnP
	 2L0QVhtDZ1SpQtQ4XcnoicpvAZOvU82khj2NPSWTIefqQdCNom4NeQq2DeuNbixD87eNH
	 6ejLsOP1AgUvreO1GyWEhX2AcXsZIVKoRehD/mmdYiBPtZoRh1JpHyweCdEsjsdYGzF0Y
	 HABkTPFGpa33UebAB673ZsY9Kgj/LMet7944G6MF5WN+7/f//KFv/ZJt85FMWlEuESQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yHaWE7Xm/pHnXA2ZfNvoIACRk3sBe6flWjeltIsyBVE=;
	b=KsmSAhWhRZZilDt8+DbyRYD74wYg+MmH9AgugqokrYaZ6BWQQE5Invutg2jSLhNMjWc3
	 fEKMAo3Gy6D19Gx0tziIbM3SMMBwLUraYzscJtaJxkDPrFpq1bcqvLHtx39qAya3TlZ81
	 3qj03vNwdsIxJYo2oqChhXA7njVor7c8MjF8J2sOtFve7mc5DjuLKXQDqYXG7gAafffov
	 BBMHkohIXgNGYkiBt+E6ZdPFGWduxI+4a1whVOBA+WCx+m5huzi06wuSqJaC8wYlvwUUO
	 RCikE5gnAR7sZ5+2Nz0UblRo3OW5NHCejpdau2VR1oj8jBBao3dWvuz5efs0qIs+OFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="j02peN5/";
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D3E606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11D3E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j02peN5/
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-386b8f2f671so526243eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447986; x=1796052786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yHaWE7Xm/pHnXA2ZfNvoIACRk3sBe6flWjeltIsyBVE=;
        b=j02peN5/pfnvC8AN61pK3Zt26cDDY51Olo5mB9VLHRWZH6m2FJE3YBsbwecVtu+8Z7
         /ZJpVNVcWOkl+Reee5uOwga4jrDyKlLStxiG7Ckl4YPS+wP/ZG38LAg21BYmMVjcg60I
         NheNnaIGwF8Z3hptx216+g+jMe8jm9Xzqys4lLILm/qLvP4eiW9zG5xbfFizmT98LJ+3
         1+PV8GhS96hwUBbn41vlL1priMrYL1aFsgJX4J+yAlFSpPqXSom2ubhRXpqvsZRCQeJw
         kYJduH3vLDa8tRII2hJQNzLwlMz/IhzKrmniEBivLbZXI/YKrv9M4b89LhXPA0+wayaL
         8d1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447986; x=1796052786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yHaWE7Xm/pHnXA2ZfNvoIACRk3sBe6flWjeltIsyBVE=;
        b=fXgwRaZCIwRBMiBLO9TtbPmQeMI+4Aoxb3A+vZYD2vHNaMbyZ06/h0dirnYJQa5tsj
         AnHsjC6llBIoUVwVSy2maAt9s4sZHbNezfgcN8DWaq1gedgXwQQ3nOQrD0MkvipXR4le
         Q6lNuyhttnAubwIPcsowAoFTiq+oH59F7TST5f5UYLd1ILlDPQSIV1Ym8GOSCk97xHvZ
         Yf8DooPE0jirf0xyKwj6l9eYccZ0DzzI0BGhePxoK9/UDyxO4xhkC8Uf7xALNyyGZZYR
         hN5vADAhc4GwdXInahDzS2gbCZwHEMJnS9Oj43tSKDeYPj+Z+7yo0cK/yMlrvMuBdZn4
         syVw==
X-Gm-Message-State: APuU4Z9dkJMKc4CAGsgQsa3ve3qLTXjp8drjQNiXDZReeUe4juvZt+lC
	Gu21S3ykzux3iQHpt4P6pIWy6bzcUU4K27ps/ElJVhzEjJIPplIJqKiM
X-Gm-Gg: AZFdTZf19WRWEbWjLo5ck4RfNyRX2ab5ffPjapH/B/1ymgoWB/OY2aG9vk+lCPdsrW/
	PwmEPkdEqqKK43P6OCHv90ZGR2+GI4gxSNeQVUrECC2aNo83PuHrCzz0DawB7FTiSYY/Y1kohQI
	Po1/P2cKlkmCaVUIeGXiPvM2nMrNoeNiVJCIaoi7u9HDcZq9G28OFMSTXUmgMtnugOm/i6sjXvh
	C4ZE5tkCPJja+VJE/ngrTCpd6/tKLnZI8kVDyQ5qFzt5hrbK5UjnKOC2sskMdzxT2dHxib/TGBt
	x2hm8/ciVZhHH2RStjf1Jtu2zyFZdNgvbvt91d5hFhGnXYKQt1Gz4+/g6d2eXE8UQY2xvhDSMuO
	of8OHHuh9LkepqOl2Gx5fDwyIsO3Lt5sozgnbMn1E2UixTq7HuJaRmKyiWTwQ3ZMgkqnxzBKxdt
	oOgQzMtmVrWeIFDfxJEgoXCNxZBNHbXl0f1RwU2oG5s76QYgB6M+OESEd35Qsn5mCQSf99ktckJ
	LgE26x4Py9KEZAVyt0MkzKMKEsdc064k88du7S4VN+gQFfHozohwl2Oy+Yx2uf9/1vAWgAxjkKp
	ly8MXFjf//e4gGcNV0g5U5JuzOgyHpRYltqLOiQ05Z8KqMfPAVztwQ==
X-Received: by 2002:a05:7301:d81c:b0:386:b7d2:a279 with SMTP id 5a478bee46e88-386b7d2aba6mr1595856eec.34.1795447986140;
        Mon, 23 Nov 2026 07:33:06 -0800 (PST)
Received: from localhost.localdomain ([2409:40e2:122d:3887:9ee5:1e78:760d:3a39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm34587395eec.16.2026.11.23.07.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:33:05 -0800 (PST)
From: Sourav Nayak <nonameblank007@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	nonameblank007@gmail.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 0/2] platform/x86: hp-wmi: fix platform profile values and fan freeze Victus 15-fb0xxx (8A3D)
Date: Mon, 23 Nov 2026 20:59:15 +0530
Message-ID: <20261123152917.14260-1-nonameblank007@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <47c9dd58-774b-20ea-b78e-0d3453be0a42@linux.intel.com>
References: <47c9dd58-774b-20ea-b78e-0d3453be0a42@linux.intel.com>
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

changes for v3:
made patches seprate for clean merge (thought it would be better?)

- v3 changes are mainly for fan freeze pointed out by ilpo,
- added a bool in fan profile params struct 'hp_wmi_fan_speed_auto_reapply'
created a new victus_s_ec_fan_profile_prams with new bool. 
- also made that bool a wraper and re-made the 'if' statement with it

changes for v4:
as per feedback from ilpo,

- drop tested-by tags from both commits.
- redo of commit msg for 'fix fan freeze during load for Victus 15-fb0xxx'.
- redo of commit comment added (on check no warnings were produced).

Sourav Nayak (2):
  platform/x86: hp-wmi: fix platform profile values for Victus 15-fb0xxx
    (8A3D)
  platform/x86: hp-wmi: fix fan freeze during load for Victus 15-fb0xxx
    (8A3D)

 drivers/platform/x86/hp/hp-wmi.c | 46 ++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

-- 
2.55.0

