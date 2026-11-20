Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194967;
	b=TohCxkTWgqPCM3Uo210hXsSTLHTdczVS5AibAgV/RgT1iuOskwb/BNuR02ANkRW/QAmj
	 cosIStOp4OVVO665gSN+9xokamnG7rmaCgYandA1SHx4ApXtI+j8uKSgj/YUX9Gnvg6JV
	 dCAlxWRrPckUN3AdKiddBVPIUB3DGhAucoUMujL9VyNuLH4iwac540OCHg2DZZcks/fMg
	 KgTA1OFiRFSxV2vC9LnSNj2cKTBv8rGKx8FGslC5lMbvheEkrLIdHlCFh+/zd0lLqQiub
	 xVjS+d0+AEQUNOvBVIRU+8M5ApOMyX2JeVEtTdYrM0yBSsViTpEbfn1z/R5agB6RKVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ad10zri1NeUwfB8wT8cUAMe2pfsqkPCnj1XoQxSAtyM=;
	b=cEOQzXvJ+7NpKfw2WNeMhOxp3f1/TdimAWozZOTcB/zKSvtpNjMObdfo7h3o6YSATjbH
	 3d3dPka0+nFoYowB1Pxw9yl6PjhPdl/HMHIc8c52u+BMCORhfKSyeBeKptwFS2eCXAJEq
	 dVA94rHf4+XbNuA+XrKI/dYhNZxYFbKhOlQUSRBXjNQOp6RucruO9BB9COKBGUXW4bBUE
	 GcZeGLqMRKtNkG/MQuAWHDeMPO/UGAvTHKbUjfYvMyyAz30xYLhWoQa2OB6Lxc1A89/CT
	 FGxNaVbvK0xaetupiBcDJC5DlkEFFIFGF7v1Rn7FEhHK5XZ2i30RpUgkUltnqBbvqVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AYj1Kphy;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B438606A336
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B438606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AYj1Kphy
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38431138772so1429832eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795194966; x=1795799766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ad10zri1NeUwfB8wT8cUAMe2pfsqkPCnj1XoQxSAtyM=;
        b=AYj1KphyjjLBd4V/PI0NWhMVoZYCdmaZRrY06hloFeD+T8gHDVou4ZKAzkkBMJMpFS
         DD/OL5TJJ4YfVrhga+du0R6u9ks2KrZUCMJ6/WAwoKqXfkGxIFmPiSRnB9/1vup0Ucfh
         MHHy1HihObWfHY1g5UY4DJSh3d6sPl2alK7+CMx3bzJexjOquxX/BeGJbcPU2IyS0BCO
         y6O5u7IsCb8I6xcx7K9hvraMy1APDNKGB1ZTtC97fX1s7LOGk4cOSmoqwTjtJ93uggvo
         Lg5Cz9LcamiyjmNa1aEXv4huAQlai0tFrqkYHpOfqqFHQJnaHrx+RTge4kaGB1t4SnLS
         NCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795194966; x=1795799766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ad10zri1NeUwfB8wT8cUAMe2pfsqkPCnj1XoQxSAtyM=;
        b=rYgp0oHRW/Ncc1pRvCuFyvZO2km+i/pXCpSO+q4FGhcrEsH4AO7ZHsxGObqQPQPeXv
         XVtsD4TeYZm0d7bNVow6QuYKySzHs0/IBNYT9zVQASeK3+p/rHVRNcRSmfh36SAdbd7h
         RwrWk5DwIks/QpbzVpG4XC4GfupXPltvy+tFNE2YGCsdvudf7AeU6ktN9PP55ZllKIkU
         0k76/HntIsaVV1GMj80KixfWFaLt3FKZeGIaS+6m0frQKRnSbKTmHj4Pvqap1FwN0xnT
         Ykpv8yyYW9Hl7m/lNK9d2lfy8AbKJKwmOuoh5hR7Wr3QQ9TAk1Nl9YXZ86yA2oRIsDKy
         mFxg==
X-Forwarded-Encrypted: i=1; AL+hErEceRsjk5m2lmSMHyR3rduAT0Yys4S/00RvK6h+X2IMJLaZq8U9jgNa38R9wBPIX2e8BtmNxgE47LmoH/s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aUygQdWxnfJr87+DID07FfFAbbetzirC+wixWp6tqW5sslOdR
	Eg0qz2el5i3W5vQmZCLImbk79Ka2qp+2w6FtDNxcmRIfbjLaToCPz4MX
X-Gm-Gg: AZFdTZdnSobZZ53j2SMyzv13PYrOwM214zVzBi8gLHniCyN4hdZWDgrpxSm73oZWSjM
	b7dQC7O/+fvwhgMtBfXSFlzHCxnck2qrs4EfhdOETGAVzZMcHD4XoCHcMWa5oX8yOohVbXynDDB
	z6p4R7RT5LJPjwlddCw5X5XuQy6jTnb5ieejU7fvSXlFf6iSruANJK83shjEw1HipR3TrSwbTSG
	+5PhX0OCix14Djtr584hEjs10KETesp/nlsocucxqd2CQqwbjpeqRkC/irAeKGgyfHn9FmL0D1n
	/qqNmlx3Q77vudKCKpLNBGurayKM/X/xwJEFkW/AS6z2KVaj3x75RZY8AdOu937kLFN38Iv7vpV
	lxHxqHV/nLpt/5Yq77NWUduUZlC9chQM7zU5zh1QCDhRRzRgbG0Y+QKWG8W1+So0YbSfKfStoaT
	UcyCJS1/wJrwhzsw5ejXAJKjiegUIexRP6dbsok9j4PWXuN3X4e8QDE+MJApZoBDuqRFaKu5GDs
	BDW3UD363iCIXRPi1MxS2JI5z2h2p6HcKJUHNKktbDIqyWoDoSfoEs9DFwjI2Uf48CZl0fz6cPw
	bOXk4Z1H7LQ01MGIEB2hH/+w44puJMQh7LITdn0G4cEVzngTPpmd+dqVVSc=
X-Received: by 2002:a05:7301:7188:b0:384:b800:2adf with SMTP id 5a478bee46e88-38571027b9dmr3560666eec.27.1795194966043;
        Fri, 20 Nov 2026 09:16:06 -0800 (PST)
Received: from localhost.localdomain ([1.238.129.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm10816041eec.28.2026.11.20.09.16.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 09:16:05 -0800 (PST)
From: Sangmin Lee <45sangmin99@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	David Ahern <dsahern@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next v2] docs: networking: correct skb_shared_info field reference
Date: Sat, 21 Nov 2026 02:11:31 +0900
Message-ID: <20261120171131.73045-1-45sangmin99@gmail.com>
X-Mailer: git-send-email 2.50.1
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

The skbuff documentation refers to skb_shared_info.refcount,
but struct skb_shared_info has no such member. The actual
field is skb_shared_info.dataref.

Correct the reference to match the structure definition. Use an inline
literal so the field name renders without a leading ampersand.

The discrepancy was identified with assistance from
GPT-6.2-Astra (xhigh) and manually verified against
include/linux/skbuff.h.

Codex built the affected page with Sphinx and verified the corrected
field name in the HTML output.

Fixes: ddccc9ef5599 ("skbuff: add a basic intro doc")
Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Sangmin Lee <45sangmin99@gmail.com>
---
Thank you, Willem.

I've always wanted to contribute to open source, but I was hesitant
to jump in. Your thoughtful review made me feel welcome and excited
to keep contributing.

Changes in v2:

- Use an inline literal for skb_shared_info.dataref so Sphinx renders
  the field name without the leading ampersand.

v1: https://lore.kernel.org/netdev/20261119164351.49040-1-45sangmin99@gmail.com/

 Documentation/networking/skbuff.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/skbuff.rst b/Documentation/networking/skbuff.rst
index 94681523e..15a9a9399 100644
--- a/Documentation/networking/skbuff.rst
+++ b/Documentation/networking/skbuff.rst
@@ -21,7 +21,7 @@ to as shared skbs (see skb_shared()).
 
 skb_clone() allows for fast duplication of skbs. None of the data buffers
 get copied, but caller gets a new metadata struct (struct sk_buff).
-&skb_shared_info.refcount indicates the number of skbs pointing at the same
+``skb_shared_info.dataref`` indicates the number of skbs pointing at the same
 packet data (i.e. clones).
 
 dataref and headerless skbs

base-commit: 362917b0b26bd16587d41a37f5fd1c252099a73c
-- 
2.50.1 (Apple Git-155)

