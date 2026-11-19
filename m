Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795061567;
	b=xbnSfI9q+8nutzgl+NTwLZcoaD26PzQbluyF6tp3CKqYrqf6kmsm134DVO4EGceNNYtJ
	 KT1LxocqbHx0vLIw0aquTzwN52X4XJLT4aTuVdN5CHoMy2ft/4IihZ9hBIPFwBXgJ/eaW
	 tYRnx6MI6NzFP/1h50CVJXSzr55YsUFbGpOWvGfS5TZSBCou7WV77pm/0rN6hwc/yP9Pu
	 cQ8qhUIsDLcUnHTfBFTKZR+uH9ngzdOuxYOnLlQXO3PrTCyVhvaLZA0Us2lAXwH+U0ny0
	 wNoSASI4hd3IPSwvfdW3gtBz8ycoOQAlJLTSYW6ImP1JKeoJmQ/iHH/r/dVFNnPOhQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795061567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ThQIZ/0Cdw7/Fte0QHHM+pd7xnF8SH/AfbXD3VLonjw=;
	b=WAYF5UPMEJqaF3s7udn+4yzqc50dMX5YIEgZ8ZXY6W64buqz38YASsA8sgXm38UiAirB
	 f6w/Y3zuOOJXp5fnwRU747U5SHuRgmU8MSFUez5BVnXc0s+hlj14uYlrTlfVBp+UBNCdL
	 RWbowgU0fLfSDZyS1DtqOEs2JkCd4U4pj2CVeX2xFxXJ4qQqe79PjEbw4t/OugBd4BeKi
	 WENRWugy/nTUAfyYUHB1RUVkL+9YSt4p+9N+gvLN3vAo9KSokuQmlvDgDiCiXTLne2ymU
	 YAsRH2+rZvSwXfhwZjUCf0mit05RXGMGW5vHKpW/1Kv79i73l8wpetKcMQruc5Y7niQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q372Zxnf;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56E160A2606
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A56E160A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q372Zxnf
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-382c3c9671fso2218383eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795061556; x=1795666356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ThQIZ/0Cdw7/Fte0QHHM+pd7xnF8SH/AfbXD3VLonjw=;
        b=Q372Zxnfz9G3qwHtYJGkKfs/bWWacgMHKyYW6x6kH+YqKC1cIKtCqEM+EZMmOA7/xs
         EYEKMT3XmMTypOqAPVY9RrQCiahsnEleXPrs/Rt7jNLfabgJaZlBDeZzwsURaEliHFl/
         NmZBqc/csrcS/1gAZvOa53QRyxawb7my9RuMy1soq0TLgv2kmLVakkiCuSXI9cf0fH11
         WLxE2npv0o4MP12kJ8tclmCGtEjQ1AI39k8/dnm0j/GgmFFDjPKGdkuIR5xfuqlUL6YH
         WSrJBi6s2geVprzxxbUK2Ij7kEViJSGfOVpq1GRi9cDkBAcFgguPdLUTeF9a+AKSmfkb
         Y4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795061556; x=1795666356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ThQIZ/0Cdw7/Fte0QHHM+pd7xnF8SH/AfbXD3VLonjw=;
        b=r4iSS5Pl8BuBlzwzFA1ZnWlSNJbKf/pP9JPN7Vk5qY/3z8zspBo1waLOh33Pz2llMi
         YC+zjDU2Yvo619DiMxEfei6txHg59GJ/LnoctfrLPiueGYhtoG5LZ2oLksnrWc63bKR+
         3lE5dlmJt+UPLJcY7IpYQ92jAANDzMnX8NPfTf0iWZxTT9cr1FIjcz+UekaymOubxzrd
         c4KIwFX26VegjomPtBPJcP3GJWYR5TaegTxwNTAI6csf1IHEviih3acyu6TqrT77iwhl
         Mgz2VN+q+Is7lFRCP1wcF+wGC/xoByQHJkZ6uJnYxOnDx1W7I4hGWEtcR0NHoeLo/feR
         Z6BA==
X-Forwarded-Encrypted: i=1; AL+hErEYoqxsp9xYckJlyw48mqygBVwMAOF+8YXepxY+7Jg+iy7Wawp6KYeJwOVJIA9ZCBfrX4ofpeZgAakdIQU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XjtaLkATMyEuaqYOG0yLBpH9ohdCLSs8SLEISvW0HfHeRToVg
	BnKqa6yFnUSkX3F99K3RuhDxzMITfqt+MYtxKaaf3rNkipMs0ukBCUOr
X-Gm-Gg: AZFdTZfbaBxLHlEGxwhGTpiv3F4ucqDQPJRqaCT9YO0seeM+Y15UJgKbwtVRJjVLiVS
	bs9B5Fd2nPVVZUGRsZrPA90i1jqfKuVjhkP199/o/ZjUW9PVvB3dpKr6vXpbLGcOgRcG4HsGitQ
	C8VtjB9l+ziTgf/9pprE9q4kP0TdeYsNvzTho62p4Aio3fgUzhAst0eXKH+qsUIUy5zXkdodMk4
	WrC9CTRFx+SKbssuJVU5SSY5/BloPxdQGswPmuS4rnmeXvFP1nU3ugJGb69DkVYH9ZToyK8+B+x
	0GTskGf8OXHDBnNL8WkBsLG8QS6hLG/YwRiDzwgvHvZnGazT848gg98Q8jDa0Sd7R00PLNuEm9n
	ek+oECngDDdD/fEsUrJwUsRKqMNYRE7o17WZFezVNvEs+3RaYFjzvK97YtDcRYsgrEqNDKXlZ19
	CAYEBgZHdYK/G2UXjM1UUi56Tn8bD7K8LoJwyYxkUOyvFNo7CBVRHpzB/lfQcwuiJVBsjsaqpdD
	+lCFZPO/TewRI89aFq7WV76Y9RbuVBUJSvPNnHhmMfrlluFX/V4xM8w6Fk62GFHnxmYbM/MnsH3
	cQ7LqJujxWzeG1bUnJcJnidUR4Izc950h93BcHlD0pilBaYtkyzLXkM7i82fBOotcTLM7DCDrPA
	rfdU8e7GvRn7d2EoDItD7hgHfOBOPChgsbw0ni4DkfZm2xVeu7u9IpaOKsG7/ZXzPlpBVIvuFZZ
	ZKLGNsS5FsvQ==
X-Received: by 2002:a05:7301:52cd:b0:375:2470:c754 with SMTP id 5a478bee46e88-3827f98f338mr4353099eec.12.1795061555646;
        Wed, 18 Nov 2026 20:12:35 -0800 (PST)
Received: from Daniel ([187.15.85.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a80bc19bsm12779716eec.29.2026.11.18.20.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 20:12:35 -0800 (PST)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Chen-Yu Yeh <chenyou910331@gmail.com>,
	Weijie Yuan <wy@wyuan.org>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Akira Yokosawa <akiyks@gmail.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH v3 0/2] docs: add a guide for translators
Date: Thu, 19 Nov 2026 01:10:07 -0300
Message-ID: <20261119041009.63651-1-danielmaraboo@gmail.com>
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

The documentation has seven translations, but the English documentation
has no guide on how to contribute to them; the only one that exists,
Documentation/translations/zh_CN/how-to.rst, is in Chinese and covers
zh_CN only.

Patch 1 adds Documentation/doc-guide/translations.rst, a guide that
covers the whole workflow of a translation.

Patch 2 translates the guide into Brazilian Portuguese.

Both patches were checked with a full "make htmldocs" build, with no
new warnings, and with scripts/checkpatch.pl --strict.

Changes in v3:
- State the path-mirroring rule explicitly, and exempt documents that
  exist only in a translation, such as a glossary or a language-specific
  how-to (Chen-Yu, Dongliang, Weijie).
- Make ":Original:" optional, needed only when the path does not mirror
  the original, and drop it from the header example (Jani, Weijie,
  Dongliang).
- Drop the sections that duplicated Documentation/doc-guide/sphinx.rst
  and Documentation/process/submitting-patches.rst, keeping only the
  points specific to translations, and link to those documents instead
  (Federico, Jon).
- Encourage translators to send a fix for the English original when
  they find a problem in it while translating (Jon).
- Mention b4 as an alternative for preparing and sending a patch series
  (Weijie).
- Carry Carlos Bilbao's Acked-by on the cover of v2 over to both
  patches, even though patch 1 changed significantly; please shout if
  you would rather re-review it.
- Cc Jani Nikula directly, since v3 follows his suggestion.
- Drop avadhut.naik@amd.com from the recipients; the address bounced
  twice on v2.

v2: https://lore.kernel.org/linux-doc/20261015125644.12908-1-danielmaraboo@gmail.com/
v1: https://lore.kernel.org/linux-doc/20261013003702.5824-1-danielmaraboo@gmail.com/

Daniel Pereira (2):
  docs: doc-guide: add a guide for translators
  docs: pt_BR: translate doc-guide/translations.rst

 Documentation/doc-guide/index.rst             |   1 +
 Documentation/doc-guide/translations.rst      | 652 +++++++++++++++++
 Documentation/translations/index.rst          |   3 +
 .../translations/pt_BR/doc-guide/index.rst    |  19 +
 .../pt_BR/doc-guide/translations.rst          | 666 ++++++++++++++++++
 Documentation/translations/pt_BR/index.rst    |  11 +
 6 files changed, 1352 insertions(+)
 create mode 100644 Documentation/doc-guide/translations.rst
 create mode 100644 Documentation/translations/pt_BR/doc-guide/index.rst
 create mode 100644 Documentation/translations/pt_BR/doc-guide/translations.rst

-- 
2.56.1

