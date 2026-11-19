Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795067859;
	b=aniTr/jEqj/s9JwlqReEAUBtRIIHQSIiKu3QkkBLIBfHGTvnQgwsoPJLc8OOA5A46rXd
	 tWb+kprzNL6jZOuEUkmcncYFLtaEVyHkzKh63HqoP0uIao97poM2WOHtsnGokcRKh5iZ9
	 FESEtEUfuHJ72OY9xcHcbo6dP5f6e4TRigIMM/ZpJMX95HHUViGsRz9mM0G/a5oXX1awK
	 5EanrJ85JnvTzMtto2By2aGKrjQkZ59zZ9SLZ1LxUcXCITF2dna8QXNsu9ejAeOErsP2P
	 DtFDbuOK4yi0ANASKZuWMUZ4vDKGyFJJQMPsHOPG15T7CmcicJExAMfKsiwBZ1eQlgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FfJFOLv++WC9m0JyoYaS7BgHTNo/5XDIGUv7rymNFd8=;
	b=SYXENVk4NZ1lnZQI/2dEDpNRrvOgwZ+LjFGWNicom3cxTsFTgTbDMnt4v+1rO8To7Ycl
	 UJo04dfO/SAE9TcmsSqrc8IHZZARsGsQHwBjd87PsAF3Ty+x788uDhVD8Qh/f1liNNYJe
	 MIU81xRrJN53QR/RzbbssDBP7HWNNBbgcEK1/SzLgEOezEDxgSeHh3hceHN6KcdERLtWY
	 HBIGN+Bn5p3cCffrtJIFIRePgn6/q5K6oKdsbRB22GH+GbzLL0ZOWAakac9dPVIheC13o
	 r8lTe59XOCPBqAX7YyuE7ssn8UuDrA6xGzOetV2x7A27H6OxIMpd7YvFekBMotrlkZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EBA65JUb;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13089606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13089606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EBA65JUb
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so1664436a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795067858; x=1795672658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FfJFOLv++WC9m0JyoYaS7BgHTNo/5XDIGUv7rymNFd8=;
        b=EBA65JUb+bv2UxY2ox9eUzkzbeuUUw25Vutf0qUGRIgv4yUMPdIa01zPNzSecI5h6o
         LvV/MaALWu+lrWqnNbdkPMcsXFsMqrmbAO4HF58np00QKwOT0Rn390YRRrA06NdJb3YE
         l+8wAs7RP1X3AL0LXmwo60pZ45zGKfXeO+bSECABikv6xbuWtV5cEuoTxUj+f9XM5V3w
         ji8xI21GvwnThReOV2IGKhi4SKnhmnqnOVkPQlpGsYSxqQNwf1C6CHQSPyqXneS3w7+a
         C+HiTPvJ/Ux7yEelEbHs2YVn3WuNgXiLl9tG9dyh41v4dGbg57n7xheH67UenNciLrnL
         waqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795067858; x=1795672658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FfJFOLv++WC9m0JyoYaS7BgHTNo/5XDIGUv7rymNFd8=;
        b=HFCQaUMeM1v8xbfEmKbvtD20rQfepEZCLzpDkzBLda324g397teS1NU2PBMXpx0Ry/
         Zw0xLM1cdXijBF2mrcrXT/YnONycxUAxfeomv7cvP4Berk75HRMAxT9/fqCZ9f87PtqK
         wrfFrCdBGLjpMViD/PauDKEtB+yT1f2Ep2jGyo5kq+HxPlKDBypuhTUS2kafixmdSzG2
         ngr8OfnEDnhsy/SCaEypwrX63r+rLnCm964xZUfuWnSdebh34r0RhB+x3yEXmtsKWASF
         iAL8lK5UrzxTvGkNx5BjI8eNScjIHzGUBsNGfPPEmdVx3/8KlaDXqXWbeOxKuGQ/Vkhw
         JnyQ==
X-Forwarded-Encrypted: i=1; AL+hErFwbYkq4IiZjV+LlknDVSWfu0C2Jg5xfGLwKB14IJ2UfEpr2DTroYbCqAtWJ+xjKyILpt+Qw+gbeEKZwkE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BrIcr77GrMld1P3j5D7AxfhbHhZpBl4NPvDjZKTQNOWyh2pE2
	YKhSYUCGDZWCIWf9PCtJMygtFyyXe4Ldtf5Nk2uI0TjQz0vtfqNgWgBT
X-Gm-Gg: AZFdTZeI+6wHzhkYbpxeQlIb57d+W/zEu2/JQ6P2NTGyjE+vcnjoMqght4KDXzqnUV1
	MqqSe+59L5GpCW8k+fwt82gkqXPrHIdFTngDNtagFjvhATEd60fXYBYDQ/h14iJuCcaf5RzIRoc
	afDlsEOpt2IQfobcooEJtDQRuWJgyg3rIINCLfMa0Fac4b3yhLeGDP80CJDbv8WeKrETiOtCyxx
	dQnLHSHaz/4kw9U7NqHl2UavZbFVnYEaOcHIqaAh13U+JFWXKtAtLOIer9PaPY1S9UwEx6tVita
	KsvEAJW5ognKWbGXjesnzhHobWoDlehgxJcz2JWjiZNdtex5HQqcZINcQ8T7+Se6KXv9G6DAPew
	duaI7wKAoS5Yh/kNDqr92ZRd5utjZzmbxLCYh5qKsfdfKsUGwWJX8+ByHHHPTgjz/M4/clUzJp1
	KGgJES3DNwOFS4Olqcng8PC/C+4DgfmLXu8rbnZ+LXPMukw42Mw5Iy28D2L0dlhzE5mvnWcIpDR
	7SFyz8amoOJx88vor2nxNbFsQN8aXC5b5GK5Ki6+dS9KXw2oQwMLvqUi/lrVfIKsg2fYoLIXRFD
	64sASVcS6cSDUo/eYIR+dOCmw6Y//7CAnyo0m/FWrI7ewrrIGTG4tpQUJ9RQ8HKNHQygc2I=
X-Received: by 2002:a17:90b:3c04:b0:3b3:adea:4b04 with SMTP id 98e67ed59e1d1-3b3d07bf9c0mr4206369a91.36.1795067858445;
        Wed, 18 Nov 2026 21:57:38 -0800 (PST)
Received: from localhost.localdomain ([155.69.167.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff5ec9cd0sm24469175ad.11.2026.11.18.21.57.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 21:57:37 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com
Cc: m.wilczynski@samsung.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH iwl-net] ice: Do not free a preallocated node in ice_sched_add_node()
Date: Thu, 19 Nov 2026 13:57:31 +0800
Message-ID: <20261119055731.55798-1-izaiahsun@gmail.com>
X-Mailer: git-send-email 2.54.0
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

ice_devlink_rate_node_new() allocates a scheduler node and stores it in
the devlink rate as priv. When the parent is set, ice_devlink_set_parent()
passes it to ice_sched_add_node() as prealloc_node. If allocating
node->children fails, ice_sched_add_node() frees the node with
devm_kfree(), but priv still points to it, and later rate operations
(setting tx_max or tx_share, or setting the parent again) use the freed
node.

Only free the node when ice_sched_add_node() allocated it.

Fixes: bdf96d965a20 ("ice: Add an option to pre-allocate memory for ice_sched_node")
Cc: stable@vger.kernel.org
Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>
---

Notes:
    Bug was found by kbound, an internal static analysis prototype.
    The fix was written with the help of Claude Opus 5.5.
    
    Compile-tested only (x86_64 and arm64 allmodconfig, W=1, sparse): I do
    not have E800 hardware.

 drivers/net/ethernet/intel/ice/ice_sched.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_sched.c b/drivers/net/ethernet/intel/ice/ice_sched.c
index a5c7a4e1ceba..dba6cc912b7b 100644
--- a/drivers/net/ethernet/intel/ice/ice_sched.c
+++ b/drivers/net/ethernet/intel/ice/ice_sched.c
@@ -210,7 +210,8 @@ ice_sched_add_node(struct ice_port_info *pi, u8 layer,
 						   *node->children,
 						   hw->max_children[layer]);
 		if (!node->children) {
-			devm_kfree(ice_hw_to_dev(hw), node);
+			if (!prealloc_node)
+				devm_kfree(ice_hw_to_dev(hw), node);
 			return -ENOMEM;
 		}
 	}

base-commit: 6055ab4d82e42de89871db03045b568ed706ef50
-- 
2.53.0

