Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599862;
	b=x+YWXONsdAI6/w1IUfUz44MAPEEXJPyjx3OiSjTkxjcfgA318FeSUOYT8rH1VeYNSpd8
	 /1ape0RTiKgPv7kMrm9FaHiv7C7WX2508ZAakUItX+2WqEXFcO8qErHvJDoH1YNJc2Gjj
	 +1BGbqXmZzSf507gaXyjDocrT3C0KEvPcQEX8v1vHOtUTR0ar1QVgoq2EH5V57sFKqFWt
	 rY286w3Hh8mnOhNNQm4G/0prwAWel/dplEV3dZFF5AImAPoGBOuhgVPbjs4K2qfsYMsBc
	 EXECabrj0bPa24x1eUIlzeCKvlfoiIYMbmDhJA7M35uKZDVh2ZIR5coHGpmYqUOiz8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599862;
	h=DMARC-Filter:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=8OOUWbtCtxV9tIRiBP4a0s1pBtXnfDPxG4CgtSzz3tw=;
	b=kV15IUk+UDF3knuAo+tloIsHPl1r3LvNpY4RYCsZlT08D6c7qek4rdpkXY6Ne0dO0yyS
	 f9kNzaTgOs+46litX1VsjvJQIKQBvM3YjT+P+k3dnZqYvOyRpBFnJRgkI6bmnLY5HjpGp
	 sC//vfoztdRIvb7OJtN6ZqQwJa2JdPBIwM2r2UuNx488JuqxfCyzw/qtxOB516y+OM9Um
	 oVymSXz8RuhKGoAE0OW9boEEON3N5w0DOoL1b2/k7AmUGlC0h6dP2m/ziY3Bchqpqc0qR
	 o8EEb+0ocVWG5fmsbPVL7C3fF/Q6zWFCw4IAc89X0pDooI0p8w7z/vLX3f8569vSJpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=CqIyFBEm;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6C6606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E6C6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=CqIyFBEm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1795599853;
	bh=qZiaB6mjEVCFvD/wUhjpP3Hpr+NdCLZygK4tpkZgUgU=;
	h=From:Subject:Date:To:Cc:From;
	b=CqIyFBEmSI1Xrj62rp2+STl6zYlvMaVec/Oqfe0Wz0euSUcDOg9lkuEYDkflCLCik
	 ku4roITJQE9QgWrdFiZP5a6M/FF2XQjzFk58wKCkWb8RFhsj+LsH7lbT2aodLaZAsC
	 eH582fNnYk/iMUV5/rLSOMmYICZIJxydDr9zfets=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/3] tools/nolibc: add support for fcntl()
Date: Wed, 25 Nov 2026 10:43:41 +0100
Message-Id: <20261125-nolibc-fcntl-v1-0-503d81db293f@weissschuh.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQqDMBREryJ/beAboVWvUlyYdNL+ItEmUQri3
 Ztalw/evNkoIggidcVGAatEmXyGqizIPgf/gJJ7ZtKsLxXrWvlpFGOVsz6NioGBG8Ouaa+UJ3O
 Ak8+Ru/V/jot5waZf4zQC3kv+Sae271/9gqLPhQAAAA==
X-Change-ID: 20261023-nolibc-fcntl-0eea08b0f897
To: Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Danish Khateeb <danishkhateeb03@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795599851; l=870;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=OCZTmzDTcEkfez1CaVtEQ7ISUvPHqH/Hy0qJGEqmY/Y=;
 b=mTOMr40L4bDKeELHMfkOz6pVw8zo3jdM8+gPnn6vERObFtVZ+4uJmxlge3W/Uw65ZUU3N62ws
 7JdpncC3yXYBxN3ZuXXpNrP5nAq17wqpnPmv585THI8rOos2FXknEa2
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=



---
To: Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org
Cc: Thomas Weißschuh <linux@weissschuh.net>
Cc: Danish Khateeb <danishkhateeb03@gmail.com>

---
Thomas Weißschuh (3):
      selftests/nolibc: split out the structure member compatibility checks
      tools/nolibc: add support for fcntl()
      tools/nolibc: remove the open-coded fcntl() in dup2()

 tools/include/nolibc/fcntl.h                 | 35 ++++++++++++++
 tools/include/nolibc/sys.h                   | 11 ++---
 tools/include/nolibc/types.h                 | 15 ++++++
 tools/testing/selftests/nolibc/nolibc-test.c | 69 +++++++++++++++++++++++-----
 4 files changed, 110 insertions(+), 20 deletions(-)
---
base-commit: 70c0be5b80661b6ba4348872850e6a0ae6ae2a9a
change-id: 20261023-nolibc-fcntl-0eea08b0f897

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

