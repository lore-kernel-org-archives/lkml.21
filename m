Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521926;
	b=33qIlTp9dUFmKjqpLRUpRjmfCzOh9251ZqnAZjBCfoxtQpUzUcP4pfEZ+CBKTQtZmqfs
	 YFK2GlkiVWHgGX2ZHQBqnk+FEZmNa94qlPmcKl10he0hxXU8UiAB0+pNoNF2kUNj5SUOm
	 d+xVthSO7cVS/3FN7ojvYmlXFTvMmUiuj8jlajx5sFniobEicVFZ68FFpj22wdabHf6nq
	 aqBd0ecLoSaTTZmZVgLdKbnWJoXh2oo/nhsGCrneUCotQGtkLR3/6qAyBId6EapfobWQC
	 kBQg6wPxOZqXA9QFPkdBhOjciQEJybRpy+o4wznAlAF96TV5cNWadcpsaSaaiPRl7Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tmJEK+xuhHTQNxm5L1PikJeV+V+rw5ssnZCLgMM/+K8=;
	b=LxozBJvHVqCXl0LISN8+7GcgpLUTfRqehXGjuSSn1Uk7Dy6OR58qXm/sad239KOAuFdT
	 +XAeDFHI2EJcVDxkTGUtft6C0lEWkLYvOiXuwHvJpSt9QSa75UaTdTP045avr72KYAyjK
	 zEEWOyBQSsINZ96F1S1JyXsr8T9SA89mJYXc4Quj2yaPgWplYAhIxTRtadCLAyMsrEwWW
	 EAjl3DPPkUQdeATNHw6BLh77b15TCH0lulADF6zYAd01FztbseD3z0Jk9UQ3ZW4N3U1vE
	 a2f3Q2gkhmLo+TKsD79GfTJ4kJU6cDIAdivAimBce913HfQAejVu0o9zIpeIM5OFawA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zUQ4HSe5;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA01606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACA01606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zUQ4HSe5
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f0918f9e6cso8333735ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795521925; x=1796126725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tmJEK+xuhHTQNxm5L1PikJeV+V+rw5ssnZCLgMM/+K8=;
        b=zUQ4HSe5MUJyfs+9sO8NZSZj5/CdRXoWKJ6Ws1Fltkdjr+s1XaF0Om10vBntvgT7/0
         dOZgqOxiZiv9wBo96j/jfyQWtWBxuqMSnbV6sxyqom4D5CDU6z0frFNOy8dze9HyGJDN
         9pvEKmF9qb7jIfd/fN2b4B4lY6tDa/UxRUzQ60dh7ShYADmSwLXr/bqXfeLW39/7j0Pq
         yohaxrQLCj+urzVwL2aTLUK1SWIJ7kqrw9TUqACllq0Urb8N1dYJaupGbKK+ferpimBr
         ZZjS67mN7E6uSLYwzW9qHClzjlwfM9YUB5Zm5G9vdCw27CepjygrIMXd8U9dAs1U4icq
         VWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521925; x=1796126725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tmJEK+xuhHTQNxm5L1PikJeV+V+rw5ssnZCLgMM/+K8=;
        b=J2ikDOSYhVcsG1U6RvIGbAanm4c73Tzq6YpQ/A7bQGNtX92L4MlTBrNIkqKd/VECgh
         f7OQ0aPWpumzzirYp5+O1+urzBvx7i+9WaZPIT00zPoHsvutHe3/JJpEvMFE4BVIuclB
         msemXX3vdConwSaaQVZimy+T5ISc9KsiUBA9NwYShqjBUgD7w/HHvQFIIQqJDuO9q//9
         95NPUUpn0vuREZuYgZcMGiQuTIqjdpWL9qaiiTgDJdBlHzqKDVrCMjKJ0pF49ZHU82dr
         IkH6FmLKS66b7ZY31D8BFN3H4BCvDDF5hFMhXAFYzSu5hIZ1KYw6PK/Mj0FcF74109wu
         nckg==
X-Forwarded-Encrypted: i=1; AL+hErFqnMhkuhyNkYYv3qqKt7viIKxFumYlirtHYkyz0VP979Ps2U23di7Es9NwU8njamMQIxsQj9hCYF2WkKQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GwhxcLgXZtVMwC6Cy8sauQJrW8sEZnnnltV/F1dmKHWzMwP4h
	kC01GbmWCaGhTvA77yst8H4JNQBEoTqa8A4N2DhuJk47gPG8GNluGfnf
X-Gm-Gg: AZFdTZf9Gqj5rbK6xmuQcvIraYA7Gn6QHLoSHK5XUiESeM3nK4Ov8c5/o5WwRR+/iWr
	5gC8HGCgpakMXDgsehD1gcVkbrPULVEPN+6CrpUvKWxqiMwn2he3Pzi0b6Nz+JY+tN2/VKR0g17
	IgsH/dZ5c2n2ZGVshFhScxdHgX72uJ0Sw8V6hhUcFkYYm/Uhepo7geXvm2Oaexg4djyYkbmH4GH
	PGuqyV/y2bmA9IfC5eMHlnR1bi74bKm/tWGVaxoLIyeAiF5wg0QRlMG82CbguIT2S36oFSg/cR7
	u8zMHFkj93tul52fTXOOg3kcdKG1hmD6tl/4AByc1jKfZPX30x8kQpkxvg7Ro6WBFs8jpBHZ38M
	thQWKOnzcRb/oFXcqVq7v9AxI9UM2n3Ga1uzWQGgfV4DVpOr3Vgr3N7FVqHNPMlzpYIBr6P75mf
	HwdFhXcVJ/GOlA3dNnnypZ5NkQNlL0J1eNcNE9Cb8qKcGU+7IhaLlcRBBu++sgiVhuMwHud2yRD
	ggzxsMwURXUbihkhWETPutpt2uCudnDNhBmt5itHind2f0kxTdfZCy2gzTlxwpnRDDoCSSEDU4k
	iCMUMCHBL+SN4TzYyUzsDwAyWMKmu904EbrhxNr7vFNwhMRsKBjqSi5etDaiFNOc/F/5AZZk/Qe
	yYfB6gTokv0U08wcXLEyxC4mmepim7oPpK/+BL91KUZazFR4rCABN69fb5juH0Fl/NLFgp5ONRV
	VY5SnerILBpwlNQh5lv9AjUCsA2A+p5R2RQXjrSbUZO0+65IhipHfdwZGCC/uRYUrrDVsDRVdKC
	igK5qS9VnafH0t2cdcP8eyYumZSoGUMM7zjaUA3pKVp+W1HFpHYy7aW/aYAUxCe
X-Received: by 2002:a17:903:1a43:b0:2ef:f46a:e221 with SMTP id d9443c01a7336-2f03f2719bfmr128352945ad.67.1795521924863;
        Tue, 24 Nov 2026 04:05:24 -0800 (PST)
Received: from localhost.localdomain (27-32-254-230.static.tpgi.com.au. [27.32.254.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f07d6d4bddsm39621705ad.62.2026.11.24.04.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:05:24 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Kyle Zeng <kylebot@openai.com>,
	Aditya Chillara <aditya.chillara@oss.qualcomm.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] perf: Reject group leaders detached by CPU hot-unplug
Date: Tue, 24 Nov 2026 22:35:01 +1030
Message-Id: <20261124120503.334-1-danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
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

Patch 1 is the v2, unchanged.

Patch 2 is the wakeup suggested by Aditya.

v2: https://lore.kernel.org/all/20261119014730.2074-1-danjwade95@gmail.com/
v1: https://lore.kernel.org/all/20261116081248.21059-1-danjwade95@gmail.com/

Daniel Wade (2):
  perf: Reject group leaders detached by CPU hot-unplug
  perf: Wake pollers when CPU hot-unplug detaches an event

 kernel/events/core.c |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
