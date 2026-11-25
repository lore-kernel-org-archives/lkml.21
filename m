Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636428;
	b=EE1qabc568BQhJnbbpvY1bNvLkBEXlSnaf7WnoLOhM9HF3x9gFohRsdbfayWVrtxx+OH
	 OBJwC+b6pQGCQe6bSN9/mgqAer/dytN0kyYfhwxNVxf167jTPzShi9y6w99eBBaKnhiRp
	 KkD2oN3Z1dXhu66FQd2oBLjLZEzTIcf2FRDAzm6Rm3qiaYWVvOqdI+jjcDl3oqVvxhK+R
	 78CPjoEDay+FgMMIDQTC8RMuomF1DN+fBJ3gZy5uHLi53XXHpCqhPaXVzMMNslzuYkhQM
	 6+JxCGgwjkMrgX1rO0UFRq3JxQXc67XAGtU1ZyTcKvP/Gh8wP+1HyMtYLAYqKwDIuhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636428;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=t9dLqTu3GEsIFKd2VeWHnh3rx2Gr2c4jkGlpEl42+yc=;
	b=RWeF5wndYEcrMkjY2FGBbxb2Kg57sBBtYStT+E2hVyQ3keqqqooVAeJVaprjN0MOzrJi
	 t4J911BYWjohrUpmc+DHmrn5QsFLlwLyweUAvAYxkUcvK+7U7t0Q4W/pXeBXNcHVpGvcd
	 GRXPHoWpH8jnPLADse69QE4Y+5CN25QvE7J+Yu8tJxgkzfiq1Fi2w2lDP5gJtjaGNFEQk
	 uTwyNf+iB2WwrJokizuuMg2jufGEMQKxL5ekqMMsiY91LrpuXS2pz+ly0FPcjxQM0HKw2
	 sAdxgbs1XYHuTnge0zVDFoKBm+J2k4PokGDkZ9H05T3NJJT9YFmT1teL7YBX0MDIH1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ghoul.dev;
	spf=pass smtp.mailfrom=ghoul.dev;
	dkim=pass header.d=ghoul.dev header.i=@ghoul.dev header.a=rsa-sha256 header.s=protonmail2 header.b="WxhQ/4QT";
	arc=none smtp.remote-ip=185.70.43.97
Received: from mail-4397.protonmail.ch (mail-4397.protonmail.ch [185.70.43.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91A8606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D91A8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ghoul.dev header.i=@ghoul.dev header.a=rsa-sha256 header.s=protonmail2 header.b=WxhQ/4QT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ghoul.dev;
	s=protonmail2; t=1795636424; x=1795895624;
	bh=t9dLqTu3GEsIFKd2VeWHnh3rx2Gr2c4jkGlpEl42+yc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=WxhQ/4QTVVMX5FTs/xoncJlNoNiQZ2QzbFWjFexdX6rcqNoQgqLvgCaGCceZzCSv7
	 HLi73RzmjXMiKwraznkDKFkN0+nwG4kzePWm5ycexPGPufBJKvoUhslYfhZAbNTUTr
	 81A/4J796pUpThfmTHnMKPo2qQ1iUktHkGSwgso/861SN7ZHnR7Ht2VM9u4VvIMTEh
	 TaDLdH/8ujM6QIzmzQe/yPYLWSczEOrA/cgruiynQ3yUr+68PqYeJbx9jVGYkt0mGd
	 LF9W72woqx2Dv9P1LMyZK0m9wltSrf6J+RrcID6S+tLvvPpCYO9QuNBshcq7JxyQeN
	 MJyWos9aeM55g==
Date: Wed, 25 Nov 2026 19:53:40 +0000
To: =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede <hansg@kernel.org>
From: Ahmed Yaseen <yaseen@ghoul.dev>
Cc: Denis Benato <denis.benato@linux.dev>, "Luke D. Jones" <luke@ljones.dev>, Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Ahmed Yaseen <yaseen@ghoul.dev>
Subject: [PATCH v2] MAINTAINERS: Add Ahmed Yaseen as co-maintainer for ASUS notebooks
Message-ID: <20261126-asus-armoury-maintainer-v2-1-2091821519e7@ghoul.dev>
Feedback-ID: 177610485:user:proton
X-Pm-Message-ID: ac55af1181630648f6ec20837faa56f50604b3fd
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add myself as maintainer for "ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS
DRIVERS" as privately discussed with Denis Benato.

Signed-off-by: Ahmed Yaseen <yaseen@ghoul.dev>
---
Changes in v2:
- Use "Ahmed Yaseen", matching my previous submissions
- Link to v1: https://patch.msgid.link/20261125-asus-armoury-maintainer-v1-=
1-053e67858be4@ghoul.dev
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ba7650cb86b0..c47b29d15d15 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4223,6 +4223,7 @@ ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
 M:=09Corentin Chary <corentin.chary@gmail.com>
 M:=09Luke D. Jones <luke@ljones.dev>
 M:=09Denis Benato <denis.benato@linux.dev>
+M:=09Ahmed Yaseen <yaseen@ghoul.dev>
 L:=09platform-driver-x86@vger.kernel.org
 S:=09Maintained
 W:=09https://asus-linux.org/

---
base-commit: 61c0dac952b9308884936d05cce97565a5c89af4
change-id: 20261125-asus-armoury-maintainer-59689b2f2db2

Best regards,
-- =20
Ahmed Yaseen <yaseen@ghoul.dev>


