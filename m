Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994729;
	b=KNMeDPD042qNe435K0iJ0jKJPPYL2rRQHEzmyojeI7J2unToj/x7bMLaqc8113GJU7/E
	 yW39uPqTSwoxW0QgkweMcuQPlYVI3/0x8D41HcR+HGFpewgHl0wqns93x2rb/UBv0et/7
	 x+2S2XZzOKJqiy6USR4+HY54oq+WyNFLmzdi/9cX/cR3oHZgX/5bP6WzWYluwhwP9EnmE
	 x4Lf8b24ENDa91jT631o8OekPYZKtJEYvccAReNukZoKZowDbdIgYZyYcQ5lb5i2jGlTv
	 mO39fXJt+ujhnHOdNpdQM3jsz9gbqKiNdQ/qZtDKaaC7QfAf9+sGqPz7xVlq0gkd5wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994729;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EoVi5OLZJP3A1SAJtxbZhp185rOwOMxBLlAcSVrk9r4=;
	b=ZCr8VXXWs/I9t3czbUmf09GgxnbqhVi6uC6n2X/IQ6Kqw1xKuUbdqzRLtJihuNcQNbeD
	 KAnrsqpgl14PdMHTVmr+qGp6Mk9nn/MWRfFY4X7Yce8qCjirNTSLShSHnaaP4EAS58ynM
	 VKtLPwtm2Bi0XSRTLstjNoMlljdC3xk+RkKFKyThb/yxPy37k6HRNEijhLgJ6N0Vr+HJL
	 NE7uKcoGEXSEJ1Dl5ITWfsqQkbd8rRY6QBE6JCiDGX1imKKPMP08IYFiYvnVOXtwbxJDV
	 HzRo6ZLRORIsr7iiijqu0dNMyvuzh3usVTvM9ErdlmFIcEzCvNFcnr5Skp107js5+fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ykuIDjKe;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F341F606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F341F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ykuIDjKe
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so2151811eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994728; x=1795599528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EoVi5OLZJP3A1SAJtxbZhp185rOwOMxBLlAcSVrk9r4=;
        b=ykuIDjKe87ULhzS2sZvx5Uu5vokuh2KsxnnS7rcPuV07riEQHxy22Io3ChHq5/9TPl
         cgQ9pxN9RO/ROM4OxTT2EiZUB3A9ZgJSsb+L/qBVjV0KbH/NPS3eqFhdqTl3F/FeRD0c
         /g38MnX36PMtSDzLAvgqflq8E7rpulCKzxp18hsNJAehmnvTGE7lo0uf2cdL/IVikjy/
         INbtiAfVvuUmiyXKSwiGxD2RVlp9eJnqEGudZ6S6WpLm662laLjxK+uEX6fvWKg/BlHO
         JBMj9+6P+rNXBhENB+RHwB+fYW7l/ItNAuM8HSWCkbC0UU/K0ut4f6YqUGUVPob/KcwO
         NqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994728; x=1795599528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EoVi5OLZJP3A1SAJtxbZhp185rOwOMxBLlAcSVrk9r4=;
        b=radrBQuC1UQCCuMRQozAXRMAENwXwrAdsg58HEu3jscptqhPIVk9YJYAEUzbJNvkWg
         dxRskzqb/N86nq/qhAb8FgkA9/AidiZGDIN+xYVaHpfet2cgiN0N/2jumUx81ZMQBm+4
         N2C0YxdFB53PprW/XDBAk9bo55XaBBoHy2fhsGTmUXu6G3yb7OlJ3SgT2K+n97K3ZIYM
         IOPXua3w4PyHWdAvFiB4KPNUa/Z0XEaWKjGiW7CSbCY8zsvhW50DjR3ZZBJT03o8JcfH
         WZdhN9G2S0CQn6Xs9QgNwxkhKuUxHhqJDxZRJIgTUCtwI76fK62OPl5svaTcn4j/FW7C
         ix1g==
X-Forwarded-Encrypted: i=1; AL+hErEa3Y6sGnqO+Ys5qTmmyrGcuD9wST67u/SXs+2iTn0fI08eZSmJc1PRLds/OY2uibh/3xbEMjgOpaG7OEY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qNVUPZOlKarOB8LwwInRG6QMMMpQXT77ODt2O6kDctsswAPXS
	TX974qyvQfk8QHQrOgLwjo6Y/u2Yhz9I9Dp9riuCC96wXrSbIkgun4W6
X-Gm-Gg: AZFdTZfiRz0RoxiTzYvexdLjHLYJq8ePyQEyCWjy0K01Dme99v85XQQpYaz8gv5xIqA
	hlUpL7Is+GLAYMSQlwqnpUAP0tt6sq9GO+f6XhfvuqumXfMKB6PG5DRagrxDIB9qS5wfbN0wSB1
	O3rfgnLpP2fSsZRffGOMb9Hataeo3Z4yV2QjypWZTWK0VNZkwHLd3yQjyS8rtfJXOGXYIiapzi4
	lLJQedWtJ9+2epPtxsswtvjtbkXlMb9j0OKXwuZknS3Q7hiXKAlLeVnFkOqwpORj7JEaV7Ih0/A
	j/fOyQvhAT0wVfidM0mv4bVj0MHXEya2WKrqjoAnOzVw7x2Xihfh0j/ZOwcRYitlnUL0geItGhH
	sOMFqpdJcCQEbfb5V4ParXvoAjKuzLqCTNeGcPXj1uP6nG12NBTd/OlxBaN1VKhteMCIgJnksfj
	10JmbbC+P+ZYybmwy4Rqi0xQJTbyCvaHpbIAbK6K/NkKBd4k04/lBWxDxANDsNLzk81b4IFLSXO
	JMmldj/O5rMJCbYci29uwOlQcnzBNzx/KJCmFotpMtr2M0yqqxpI2lBwuKR4mh2V4TfPKRSVI4s
	BgA9bPM9C4vP4U669s17sqlFkQCNwiOz3Ck/ytZTd0Nf4vYx5dGXdYafKFk1EBnoKgc2GEIMP0E
	A2K4tai9jjP+TIJAdZjYVcoKDcad0KLgBBmOBu3BM
X-Received: by 2002:a05:7300:b196:b0:377:678:2309 with SMTP id 5a478bee46e88-3827fe76e1bmr2073650eec.15.1794994727862;
        Wed, 18 Nov 2026 01:38:47 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a76d70fasm6365704eec.22.2026.11.18.01.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:38:47 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnav Kapoor <kapoorarnav43@gmail.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v2 0/2] ASoC: SOF: control: Check the volume and switch values
Date: Wed, 18 Nov 2026 18:38:38 +0900
Message-ID: <20261118093840.3514408-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
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

SOF volume and switch controls accept any value from user space. Patch 2
rejects values outside the range the info callbacks report.

Peter pointed out in v1 that snd_sof_volume_info(), which the controls
with more than two channels use, reports the maximum differently from
snd_soc_info_volsw(). Patch 1 makes it report the same range, and patch
2 checks against that range.

Patches 1 and 2 of Arnav Kapoor's series overlap with patch 2 here:
https://lore.kernel.org/all/20261117105953.188645-1-kapoorarnav43@gmail.com/

Changes in v2:
- Add patch 1 to align snd_sof_volume_info() with snd_soc_info_volsw()
  (Peter Ujfalusi)
- Patch 2 takes the maximum from the helper added in patch 1

v1: https://lore.kernel.org/all/20261114021730.2349347-1-sammiee5311@gmail.com/

Tested on a Dell Latitude 9420 (Tiger Lake, SOF IPC3,
sof-tgl-rt711-rt1316-rt714.tplg) with only snd-sof replaced. The
mixer-test failures went from 9 to 0 and pcm-test is unchanged. Out of
range writes to the volumes and switches now fail with -EINVAL, and in
range writes still work. The laptop has no SOF control with more than
two channels, so patch 1 changes nothing there. The reported range of
every SOF control is the same before and after.

Prepared with Claude Code (Claude Opus 5.5).

HyeongJun An (2):
  ASoC: SOF: control: Report the volume range as ASoC does
  ASoC: SOF: control: Reject out of range volume and switch values

 sound/soc/sof/control.c | 49 +++++++++++++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 7 deletions(-)

-- 
2.43.0

