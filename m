Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795307723;
	b=xw22cdsPbBCD0ESVmNYf0G+4XO5RmUvjTdHotg4IzREnKeBBljfJkNzzTFPFjGYmS9V9
	 c1JBWfbDMMFFdvdK0QpnfSBlGjO3fKLedUkaAkDTr1oDooFBBvoPZvr25gO7KT2uGEELv
	 7pr7FGPW18qVep9TXYgEee2tp68JpsYnDCla1jw6c7dAAyncTRuQxWnBAKAClK70SuTWF
	 AHj9hjWb/+eTSnWPXCWOmq7J1+KZnHIjV6ddItyMdQXLYIV9vPzs/P1kZE5DGZdTT2QF4
	 LcHdEZ0WV2El1v5zKcHyoTT8gY8wnYL1F2IA4YsDnyXMRMUU344KylGP/q/drpddcWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795307723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kjaMl1GYSNrUShVsKdQDcYu8vOCY8jN+h3QDwdEh4x0=;
	b=47aDqRqVP5W42Vp5jnwzpSSvzAjQ5EPFGREXqJP3h7M7Cw+XlmNgfW7Im7HILHPluN6O
	 y0v2NxSKIYpIRAddgUA40KDsjGrrIu2yHHkhnIKtOMNgS/Z1kT3zmC2UYcST5ctSdB24s
	 HvcifRZuTEQHWUGjlOWBe0Ur0ZtNdvdScsMipNaGVoWmn2JYwPx29qZ5q6ANOku7baKbc
	 1fMq+PQCBB/89nwkol2B7ahNBMp1Jga7Itv5nMNgKyj6FKVGG7F3LPrTgS/mykwHG82yW
	 nZtINTJfn6NLsEpuoAIYkpubsoPDpjCUsU0xI8hOMbyvN4O9W+Z9Yu0SQzVRc61Hu1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7OdNw8u;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC239606A336
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC239606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7OdNw8u
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso21276045e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 16:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795307721; x=1795912521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kjaMl1GYSNrUShVsKdQDcYu8vOCY8jN+h3QDwdEh4x0=;
        b=G7OdNw8ubMfnu0UlmljrLYczxmam37Hvlt7nwb3a7fIYbFNVpqqckCTvlyUy1f4gwX
         63fw7LL0vzy3rhl29hr2xbMTePxVpQvdpxLddNixhyBNaxZ45M/43wRuyMv/1gdQgFCy
         ylAMaoojgKS69rcL33985uN2DvVtg3Xsf/hOI+B7tNZyJL3Mq0WlmBWQV2R87SbI0NKo
         jg17r3X9bdBEPbNxBUheGepbPqBX8ql0Kcfa74PbzAVoEBOpxgXSDTdXx2sk/m27assf
         jICviUjUsNVIg8krFyn90l/h5CgnJnRl3QcZOZIZQnzCIEEwuff/PMsKrATRzfZqC/+t
         YtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795307721; x=1795912521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjaMl1GYSNrUShVsKdQDcYu8vOCY8jN+h3QDwdEh4x0=;
        b=t62VIMDWNt2ioknU5QiF5stSdjer2RLfaHtq77L439OoLMCbwndaBOyHX8MjrxyxFb
         3HdAcEKofxdM5YR31Pzy5s6yQh/3uunnIWyiqg2EPfZsvLJ8wq2mQR9tyzZ6kBf/wKEb
         tV7IQ9ZNFk51Wd5jlGD5VzmUoWN8vxB1jF8NTw0sieEldFDGEGwq/CJJBPiWYX/C0xea
         MmhKmzMXb+gfGgY0iQyjsTZ3tzJhXbu/kBO6kekFAWf5hp3gJ0smle7vLHfiweSPSZP4
         /58Ajze1vKbpDUjlCoogWQD2E8x2w3yi1gDUSmE3alwsAhQaXX1Q4nnBnYo9lTj183m1
         4E9g==
X-Forwarded-Encrypted: i=1; AL+hErETBxvC8BUa8pdirdSp/PzPm4UFyvle6Jnc4GU8m9NrjvpNGWUskPK04UkdJIvJmj14ur5sJ2qJJvL7Lzk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HhOTl/nkg7U7XmR0Iw8eeeP8CM9sP51kQN4uL+VzOSHUH9o6A
	b4zu9oWgumQ/hdlFslktDaVpXjvlKlkaREwgaK1ukd0fTyabs1ge0Jav
X-Gm-Gg: AZFdTZdxbmwU3NtaGwl0viMRCE7vbE+k7y5Vlrmss+3SL1f1/VeIJ/OvMUNBabQSSIe
	YLY3siAcghxriXEtg18rGCSNo7t/d/VZFxeTCn+jAbMwf0nT95F7ctXBUDiEMTUFQSaZ0tAaVz9
	AW8p2jB15UfPcGqk5k90H3Q33hZNx90O8ne5RgjFIzxpsBNA8eN0hvsw+M94OfMOOrH4iysH9Q6
	v+1Pqarj/8e/GjQO4HdhsJxnHT412m1Q9tnS8XpJ4To+TliFN9w9iWG0YzqR0UPd4/l6H3W8DwB
	1pJ85BJiGv6eCMPCJnqxKfDFkXYQABp3zvMH5Ef0lvszJKUI2k9RbfiHEgis8ZJeDrzn2yu/gGh
	AXf/jg1mJmgsxIqdud7VSKBalXV9O/ER8N9BF5UoDOfoWeFPIMFNGXyin8lWzQRQMQRwZkHpEi7
	M6lXkNeseGqc8cjGIkJXD2+li/RAqIRIZIkXYqdmqAUS/QE7Wj4pcwiFrHCZtBN/Plpqs/rDuRF
	KNIsD053PouaIGasEFR2MP43c2g5sDQrJPggn1rcU0PxAt6ueXLySnEmwzUnNCgHnRBcdg22QnV
	jK9dsuMlnrTxj9nLQDE1TXlp4b0pOt0sMgnEiso/BdeF1VjAULoFfEeioN4chLEZhX9sFh3dfAJ
	W5mKOGUzh8sDOAOZL540gLDxfJq2hug4M8xShuGEKHQ6GP0zyTcOPYXBsEUx3jMlpHm4dn9GT49
	wWgguuZsPwrzAz59rl88u+/jzH7toYJVYOQNe0YR97JZpCFiEThaHCXZBCQky0UPFVomEDpLel8
	6UWE6miU6he/SM2wA==
X-Received: by 2002:a05:600c:45d4:b0:4bb:6994:abf0 with SMTP id 5b1f17b1804b1-4bb88817d91mr170289725e9.23.1795307721109;
        Sat, 21 Nov 2026 16:35:21 -0800 (PST)
Received: from longitude (2a02-8434-fda5-4201-2025-a95f-1d53-595d.rev.sfr.net. [2a02:8434:fda5:4201:2025:a95f:1d53:595d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906817ccsm74017825e9.5.2026.11.21.16.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 16:35:20 -0800 (PST)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] tools/bootconfig: Preserve tracing settings across export and replay
Date: Sun, 22 Nov 2026 01:34:57 +0100
Message-ID: <cover.1795307698.git.edumucelli@gmail.com>
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

Hi Masami,

Thanks for reviewing the earlier bootconfig fixes. I found two more cases
where a tracefs export loses a setting when you use it again. The graph
depth is exported under a name the kernel doesn't recognize at boot, and
an all-f CPU mask is left out entirely.

I checked the rendered kernel command line and exercised export and replay
on my Ubuntu machine using a tracefs fixture. The series is based on
bootconfig/core, including the earlier CPU mask quoting fix.

Thanks,
Eduardo

Eduardo Mucelli Rezende Oliveira (2):
  tools/bootconfig: Use the registered global tracing parameter names
  tools/bootconfig: Preserve all-f tracing CPU masks on export

 Documentation/trace/boottime-trace.rst   |  8 ++++----
 tools/bootconfig/scripts/bconf2ftrace.sh | 21 ++++++++++++++++-----
 tools/bootconfig/scripts/ftrace2bconf.sh |  9 ++++-----
 3 files changed, 24 insertions(+), 14 deletions(-)


base-commit: 0ad31c3252d4c626a93ae6251340ef86b18342d0
-- 
2.53.0

