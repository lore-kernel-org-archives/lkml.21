Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147469;
	b=bbjLoHETWHPD+4aY6Nc8irKIO2WcrXiC3RRzKC0c7rOVjLaJ3otDYmPVZ92ZFpIjsljj
	 XbDbBosjGhDJxBhLVrMVpQMHgnwm46zv5FoRQKM6FbuJAjL6pDdP2bw0D/UgGJ0veQdmt
	 YfK/+c20o9TZJBNRwdHJrMb6RRKlnnjoIQjGMU1dWxfF7cfUWRNf1cksWMKN8p49CVyTE
	 ZbFYx+0lsSO6M4wvHfxHDC28ghOA97qBZjV/K+oPf6yF/FrZdnlgP3Jx41EmP1qjUhrCO
	 Ub7YXfZHOUjflWvpB4cs426BKWPhbjAUT40oiaG2fkSXDj2Layi6x7pj0p2xMrE36qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iMwW2JLY+HI916hc5v6/gg4kWQ5njDV9vffDoqUd5vA=;
	b=49OvjDjSHa2T+3pVX7pHenjHAVtZxxDIi/OwNLg4i2N/tpDWzh0ouBQW0W3Dlxu2t7cc
	 HbMfZ57X7Aa08WPywpdSVmzumxhu68ustNQRfCUcJlHM3RTnIdPv3S7KzdSxZoUU68K1n
	 JKZLYKalaufbE31HNoatXuv8+l3DE/DJwF2TQWegw2f4ymF5KuELHTE+UPEVdW00zaSwe
	 EGJRO6Ufqw+c6ZhmC+OlZWkkAwnDH6js2pbPl+3aCZQIhYPBykJ2UxQ3Pq59XUQxhhAJs
	 R0S/ZqQuEqhrYXEC/ivqhmOT4siry6Tq1Z6NAbB/XX2wnN+zSVAxtuJEHgVc4xTcwsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tF36qyew;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AEA606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7AEA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tF36qyew
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36a315ed211so484920eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147468; x=1795752268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iMwW2JLY+HI916hc5v6/gg4kWQ5njDV9vffDoqUd5vA=;
        b=tF36qyewyIH6VlnEqdNY4stW+Z4jv99L2lbunEb8dtsSd0rJ3tCVxhWGEsRorOK8oj
         gZTxCMMyB874bL2r6PXNn4RL4WMWEH+emvlIHH9f72TJrb82P/TytbFN94+Ni2ja2XvD
         1FB7PoAwiQb0J1vAFmzuhyGn1Uz2hKtfexpft3Jx1iPpivar9ah2JfNFVpv7+LX0buDw
         V2KEPOA8MYYwHL/ixYzP/BMEL7ByL/bEYK2g0f0EtAz1RygFa+6QNj55lKStjanLLFfo
         cP1LhvmS4bZLdCX7X2+rvdDj9XfM0I+a7LzQ9GnW76vzM1OQmnwIr0zEpfTUMd6hXHZO
         mY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147468; x=1795752268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iMwW2JLY+HI916hc5v6/gg4kWQ5njDV9vffDoqUd5vA=;
        b=Ym6CrpRbl1+vISK37MGw88fMOHecw5Lk8bZAwuaezNArMA/TFGGD/8D/zWjZAHbFZg
         NnaiFiO9nZM2UbwMIluzCB62oa+7Oq2NC65Yls9puTwP7PvUCxlzo8rbl0aVyiHM7K01
         BJODwfJbMK8+OSXD2LgE0WXg5EjfY02jf2yCsYXrX7g5SaVBiZV471YPZAvnZlHZkwsc
         tiuQ/m930J2RgJ+johDYRrryZrQ+kY9JDNdlmro6UGu3iB6QNS8PQsncsDVPD7ODlhv9
         M6CAVnGPZeZvyC1vvW/jTIteNUMONSa6AZ4B/n+x3EVrFMUO6HJniGtI8l2gyrAmtEO9
         FeuA==
X-Forwarded-Encrypted: i=1; AL+hErGy5H04A/RZAKV0ps+VDW7NEACFuhyKcHJbV/BcL/Mj96g3yQJTYWE4IKcAxqbUr3rHni6orHqk5ggXf6s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VYAHoKrQVkAFjEa9c8RQ6izDGy8/05h3IB02UaaoVFqgwYAZJ
	kA7F42BsjmCGo6mWjw/cMvZ1RP+XQUgsNSfQgtcrIl02VUz1dW/8KYC/
X-Gm-Gg: AZFdTZcy0yDFIJW8T5bwKTKf2/iqdmD71tBujkObEJI1eiw+Xi07myTUE5SJYbDz/yx
	TSLxD4e0oJ1t0fKTAypkfgPjrqsjazQzEeqk0E/Ec/ZNoq0/5Yfl9bFOs/vi8N7k3pis816Uc2A
	WEX+e7P333UzplUJbOICRacBx0/1tFCT8tNprmIF43bfpKVXHs4cGTP6SSfKj+XBeqQ2kJWQTzW
	4xjw5Yi0yFq7moBoqOFpjeJc0naRHZV3f6amgyinbhuFaUGFwp4wP/gKBRV96MiZr+ytBUTdrxe
	voo6A0AeLis0U2zpSitlYczdtYIdL8KxsE+fVtlH3MqAZDD70S7k+jQ6DFWUWrf5pidGzVeLTNl
	G+O3jei6IvFN9g/FGOK/+1D+CPayQ1H5Fp+qd/cj/DA5TRbPcWXS8gt7IbPLp74Sk2SBgP1BCa0
	Coxqm5C30dnlcZhq1GkUsFdHcHDq/QpCFIywg+o66jEN8d68K3SVzsXy3Cuul4jfGYcHlxEN6nA
	IOAMbU+cBdakh6fm4Drh5PbH1D/TkTxk4CW/NCTbPMhtNqN7jSfMfmYi92SCBmMBdKxpGrGn7kS
	E9PT5ttwHRRJBY9VvN9MupL8awvmebPh1Q==
X-Received: by 2002:a05:7300:e9c4:20b0:383:6f73:eb34 with SMTP id 5a478bee46e88-3856c6b00fdmr1716713eec.2.1795147467898;
        Thu, 19 Nov 2026 20:04:27 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm3246104eec.6.2026.11.19.20.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:04:27 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv3 14/19] powerpc/pseries: Annotate the RTAS physical-attestation sequence lock context
Date: Fri, 20 Nov 2026 09:33:13 +0530
Message-Id: <2345452806a2a056bd8355e12cec2a060f385d2f.1795147055.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795147055.git.ritesh.list@gmail.com>
References: <cover.1795147055.git.ritesh.list@gmail.com>
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

Clang's context analysis reports:
  papr-phy-attest.c:154:1: error: mutex 'rtas_ibm_physical_attestation_lock' is still held at the end of function [-Werror,-Wthread-safety-analysis]
  papr-phy-attest.c:169:2: error: releasing mutex 'rtas_ibm_physical_attestation_lock' that was not held [-Werror,-Wthread-safety-analysis]

Add the necessary annotations to phy_attest_sequence_{begin|end}(),
to fix these errors for enabling Clang context analysis.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/pseries/papr-phy-attest.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/papr-phy-attest.c b/arch/powerpc/platforms/pseries/papr-phy-attest.c
index 350ba26e5962..d2bc5c0da422 100644
--- a/arch/powerpc/platforms/pseries/papr-phy-attest.c
+++ b/arch/powerpc/platforms/pseries/papr-phy-attest.c
@@ -133,8 +133,11 @@ static int rtas_physical_attestation(struct rtas_phy_attest_params *params)
  * @seq: user specified parameters for RTAS call from seq struct.
  *
  * Context: May sleep.
+ * Returns with rtas_ibm_physical_attestation_lock held.
+ * phy_attest_sequence_end() releases it.
  */
 static void phy_attest_sequence_begin(struct papr_rtas_sequence *seq)
+		__acquires(&rtas_ibm_physical_attestation_lock)
 {
 	struct rtas_phy_attest_params *param;
 
@@ -161,6 +164,7 @@ static void phy_attest_sequence_begin(struct papr_rtas_sequence *seq)
  * Releases resources obtained by phy_attest_sequence_begin().
  */
 static void phy_attest_sequence_end(struct papr_rtas_sequence *seq)
+		__releases(&rtas_ibm_physical_attestation_lock)
 {
 	struct rtas_phy_attest_params *param;
 
-- 
2.39.5

