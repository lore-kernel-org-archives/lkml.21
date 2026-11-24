Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535091;
	b=EVMMZ2/T1zyLJGGIFxrSzsq4Ni/NONEGHcJmH8OoCwByeoF9A11qOKl3YZ6zfcf2pYiH
	 lVSp6NfDcmuRAplZm8KBcejTauoAWe4HlL+v0a6/tY09/cLkD5McxRYZcd9n/HsrbfwAA
	 H/DPgskdOSVHI/VfJjlCJ24tbAWFY/DkZIsUoBbf5Sn6BC8ovF+CCgDF/JC12ohNyciQw
	 Y1tc8TMCriwRnbk/ig5S+OWKS0rq7RtIB6gRFH/QFcrVaIrq/DlI4pilg5MvP8fkI7D4G
	 PcUG9PR7Jf5aHsoRxJhnx81o1CH7EoWPGxJMXcUJZ0M0SuogQIYtzHbmFI2ARUi/06w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TSdQ5TOQ0yFmH1YFXVI+vRhBNVbXW0tI8IkIMvJt8n8=;
	b=sAseNMtRnfMHsIbc5jptvG4NjiFkYwCOwPUzKrt/jQ7FO/7l3s5C5tYSbG3/a8qVmb7Q
	 SUDeOu/mxwap6a38xCQPDN+4NZbmMLtDOD7go0ngzegbFfY6C8g215+nzVMVZaOyWm3ck
	 2ojD4owcwadkHzHX1Aeng0PTrONclvaqeN0ChME1LUOYYAGfjRn2iy/odv80iAWdkw/3G
	 0KgVXSRHssXHrjQoHwqkdxc9NYIAuDC+Rcs3hJoZVZ9kHbLtGQqbvGudXOGAgSwa9eOkw
	 OcH7rQF8zBxXyjB58/FxacKj36CpaDQmgxgYNetOa+vfRxm/Cm4knj3sz7j0Xi5Cjfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YgHWXKtt;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F90606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20F90606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YgHWXKtt
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3ada81853so5388638c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795535090; x=1796139890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TSdQ5TOQ0yFmH1YFXVI+vRhBNVbXW0tI8IkIMvJt8n8=;
        b=YgHWXKttSB/vDprhk+AB///I7J13iKAgNwCrY8P7tXnOHqb1bgExM/0Y5328UZ26bO
         vNvGrA8x/nCbo0rmeV296KaMSHPcRwUEdIjIhkesIiq0lg6KHQTuNVHNZKloyATDq/+n
         3zgc9E1UVMYOSPOtlxismo057o9iLNFktuQw8o9zgUwHCxzF2a6SvnJU66POe9rSMSC5
         uns0vgSF/esNFrkAd5i18z/62CHW714LGvua/NMu3Vk3AFbCiOsgmqYR7MUVObY/3f7j
         WEfthZITTT4VbTj0WtWecXCVi89OSV1HChVqU/8o0XyzOUjVTMMbIRkzwtCEgex0LI2X
         Tyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795535090; x=1796139890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TSdQ5TOQ0yFmH1YFXVI+vRhBNVbXW0tI8IkIMvJt8n8=;
        b=Hl6JMlP+urEj+yR0CkZy7mH5N5/ZXKhdpYgLNPE+5FRiGm++GFU4KzA7BtfCmrBVRm
         3+zf/fBS5YqGZsY38pfdnDWaB3LwpC6YzTtelAwpZYLO4SAWy6SocgIGqoESF76fWu1l
         jRvpUxenXH/cdr9VwhGTcL6xmzda/ENF9JTJys7pUsl1yjvsYj4twUlEQsZlsKiBtc5H
         6xMk7h2EOoitpXnNZ1wUXQ11sZDpD5b+jDOlazSlyB1d1m7jPAogbwE1bV7z7BHvQgld
         ML3ZOXfAyE5TAgHLPku9o3vLMe0AFYvJ9jpTk1cPLKopxPl7obNZkrqqcqV8hBj+D0Tw
         mHHg==
X-Forwarded-Encrypted: i=1; AL+hErFPpgtEn/PMiQK8D0Mrq30w7zRyCPPpPCnc1y97wQB17F1A/BOf6boMp+AwwL0BDqHY2q7MK0f8sGJGAmM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JYxxJGeMxxmwecjepQilkJwcU9fOVpxDp9FxnGssdElViozhE
	0akKBr1QwVgYGTivi+4m4E15iMWENUIH1if6en7zRWhbBSKlcb3F5xTPhQn7nAl8
X-Gm-Gg: AZFdTZdepzWgVUEcmtRPLQDIhOvmDWldz5fMvTyD7qxdilFivNKfW7mnign0q26eZ3W
	1PpDeH1uQWQyhNJsJmUjrf8liTW2loJ+NcbfxxA9FgCW+XUdAsnjYu1CNCgBmWbKLcbOQp8iFDe
	mbM+q/xjhB8Pb71zIWEiDe2ZL7B5igjcOGCkTXjjzjEiMwUDB1irkzm3iNz2izcs/FlMMCJJFQY
	yi1WB/DziO+nz6ixUWxdiDUYDU+NMv4/5qHLmIFFzIuGZf/kSRZZjUtpWqVadM/CuniJEhY28Zp
	U/Y/BAq6AEvrW2HO8Gj5VOjOaqGfsDIcV8S3ybNFBM9Xb5is7RE6GUjqBLgePfqSoE0i5dTT9Kd
	KiQq/3NP2qkBquzz0cbr7/iQzmkinZUpj5Ud+ey8E+tUOY7X3Jj5feWOAfmq6p5PbEUTqT8kO1z
	nF8OD+yIPxxf8FEKHuZv43yzVau7zznFG5z4U2uhri6A7WoHU/hvt1X7t+eWq5f6KSz1VkyNb4M
	e3L6K0mpcawM4N3u7cpGjXAdbB9evuPQBEbPTlt1hH0wvFS/btTTad/tA+DMXBJtzSfFJDigUoz
	IyUI+CC5FXr7gRZkQ1H2QDhLxiC6mn9ArIzZ92GfBw==
X-Received: by 2002:a05:7022:f513:b0:1b3:b53e:b4cd with SMTP id a92af1059eb24-1b5568a951cmr14140772c88.21.1795535089896;
        Tue, 24 Nov 2026 07:44:49 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm58746964c88.9.2026.11.24.07.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:44:49 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v3 0/2] arm64: errata: Fix two Kconfig column entries
Date: Tue, 24 Nov 2026 15:44:44 +0000
Message-ID: <20261124154446.1094507-1-takano32@gmail.com>
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

Two rows in the arm64 silicon-errata table have a wrong Kconfig column:
one names a symbol that does not exist at all, the other misspells an
existing one.  Both changes are Documentation-only.

The text was written with the help of an LLM assistant (Hermes Agent);
I reviewed it and am responsible for it.

v3: the commit messages are shorter, as Zenghui Yu asked; the diff is
the same as in v2.  Zenghui's Reviewed-by is added.

v2: the change is the same as in v1; only the index and hunk line numbers
moved with the rebase.  One changelog sentence is replaced in each patch:
in 1/2 v1 called the table row the tree's only record of the erratum, but
irq-gic-v3.c records it in gic_quirks[]; in 2/2 the sentence about the
symbol is reworded to name arch/arm64/Kconfig.
https://lore.kernel.org/all/20261121083950.1957044-1-takano32@gmail.com/

v1 was posted on 6 November 2026; please ignore the duplicate submission
that went out the same night with other subjects on 1/2 and 2/2
(20261106235616.1533003).
https://lore.kernel.org/all/20261106234541.1474324-1-takano32@gmail.com/

TAKANO Mitsuhiro (2):
  arm64: errata: Set GIC-700 #2941627 Kconfig entry to N/A
  arm64: errata: Fix Falkor E1041 Kconfig name

 Documentation/arch/arm64/silicon-errata.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
-- 
2.53.0

