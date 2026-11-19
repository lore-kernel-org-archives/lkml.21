Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090490;
	b=gAq2D2zMmp/GhN+uIzSCZR0jbVN8jaglEj6AVTanFex2aPwD7x/AEnmhQoawzxKDtak0
	 FsiyOregoMkBkWnOgwiyN+cHzF+VYONbjEzCANgNO6vJ716w5A2J4R9xXkRYrF6mll9aN
	 emRdc/34xOyZodJNZKPxmd+EcLXY1pvIlgtcUX/93VmVeBV9t5dDsgJ1coXSpkGRje6rX
	 b97SaFN825WPZwSOLRkuyGaqO/ISZ4Q08ftV4cALESZ9tqDQRbE6tYTcwHsqfg1++VhhG
	 qibPj8iNsk1GFQTOmFKkwdEyZrvp6KOXQ9tDXJu6h8/tQb/QBVLnjl0Dv49KirWsTDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090490;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=KPwgoK2ctYkEIoXLDhQ+9ixRvnytQ+HTp/D7L99rIqE=;
	b=j8qAVp4faKzxcdLuRVfCLMxaUQKtXapJUfXndi43yHUEK+oaTshcA3hpDx9qdyG+q0J+
	 3S9bMBal1NiFrqZNN00se1XKip6w39tuUwcHROHIYGw/g7KMFUkyVq7++pCM1O9ItTVwC
	 KcevW3mm1bQ4lGgEelp3O7Zu7N0QDT0i/DGC7rLK95I0cTvi0twyP0PCMPowTobSV3NuC
	 qqBpq2+4A7iPNV0KqMGvSe6h8cCcpu+ndVpDzEcTqJ/Moc6NgKbSY9fDumieu1WXD4OSd
	 coqQsoHOfoELSmlQw0Zimdd+Z2cbsCDgo3niHsjK3NhHI83RiSJnVbPqACzl103a8hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=kVFQqDBC;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=E4sAS0c1;
	arc=none smtp.remote-ip=121.127.44.66
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924A7606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 924A7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=kVFQqDBC;
	dkim=pass (1024-bit key, unprotected) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=E4sAS0c1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795090483; bh=KPwgoK2ctYkEIoXLDhQ+9ixRvnytQ+HTp/D7L99rIqE=;
 b=kVFQqDBC+crWGyazLnC0gyGSRFkDlZUWjtBodVuMawOZAp7v725i9zKg75Bj/Te0MOc17x1O+
 ni08GL2AcjO90b+rv68hAZpgEKeMh30Y2NrgQWOejcI8bXZ+S5Lyp/pZxiR0ahKdHOAV/DpuGEH
 bVVTF5KMKoUPg5yH8+rP6+1FniblEzyJqM5WPfzqrZwB5UeT0iZ1PjW0W0i+0npMSC1QX3AZtR/
 +aHGAYpGsKSfcXb/lwe8ERaEueh+9ObiE5W2iiRHho20VqV0Npzx3rYvPlylcq3Ov5bIUnEM2vS
 oMy8mFw3P88zeJyREmJKyrjEDuz6Fm2+3iktfbOiOSvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795090483; bh=KPwgoK2ctYkEIoXLDhQ+9ixRvnytQ+HTp/D7L99rIqE=;
 b=E4sAS0c1ftV4X1auGU4iAWL94ziJboI2mwUr70kbLYiCHylqnWJqdKDEVo+zmE0QPlXkYg9Il
 wOLBOK34xR01PNU0QAkPVmN04HTzhAWlfqokX2MDQIfsVPXlA4FMme+L4s7zn5Hg++Y85pa0bLZ
 bZFaLFJWE102GwOpZ2Jfjng=
CFBL-Feedback-ID: 6afee831d37bc4966df160da:3d0014e63e262de90a9d6bb08833dc93
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6afee831d37bc4966df160da
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.19.33
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 0/2] arm64: dts: rockchip: Add FriendlyElec NanoPi NEO3 Plus
Date: Thu, 19 Nov 2026 12:14:30 +0000
Message-ID: <20261119121433.550704-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
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

This series add initial support for the FriendlyElec NanoPi NEO3 Plus board.

The FriendlyElec NanoPi NEO3 Plus is a compact headless SBC based on the
Rockchip RK3528A SoC. It shares most of its design with the NanoPi R28S
and NanoPi Zero2 boards.

Jonas Karlman (2):
  dt-bindings: arm: rockchip: Add FriendlyElec NanoPi NEO3 Plus
  arm64: dts: rockchip: Add FriendlyElec NanoPi NEO3 Plus board

 .../devicetree/bindings/arm/rockchip.yaml     |  1 +
 arch/arm64/boot/dts/rockchip/Makefile         |  1 +
 .../dts/rockchip/rk3528-nanopi-neo3-plus.dts  | 96 +++++++++++++++++++
 3 files changed, 98 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi-neo3-plus.dts

-- 
2.56.1

