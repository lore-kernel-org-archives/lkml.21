Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019400;
	b=3F4iS/9FUKLehVqHysA4ZhUWQTd3Wdztwp1nZfo4Dw5Zin0RfXxVyLm8vKMV3QKzenIa
	 pRcJSFG7+15NmaIaxKxK69cKZtoVjF7cF5zAm8SQ10Aww17h8wFwH38i4bbTsg1OzlEPT
	 1pB1SAWEAVJajIiyLaNgthKqTRv9D+l4RnMALK93HOF9iCtrjRyB5jRFbTezLh2T6LRe2
	 e93CfKIGc9euUOQ7JMJHMStfSrBceV0w0Wlc6QyxfW1ubA0NSMd3LtN8n9WTNlpG+avBf
	 ysLgS7q8t16WWxQIJ+9bs4G/S/7U20sD7fUoI6DDLyZh26fYBKemhuNmLofv96L6YLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Rpi69KOE+RewZqGKWGe5fV1itNLcgLER2USO6GkvbTk=;
	b=wb/1KGARgtc37qo61jPue+bW/DtTp9X6cZPouYvsKzAzht2yp7LODbwhppyt3d7KYCzp
	 R9pDlgKFVChU4VGV1E6DrnfSQ2b5G304phTCAO3+GQDfGPHjIu4mdWh4rezqIHx+WQfKJ
	 SvxvoemweI68yFLSpVA9iQA1l8lrI0Xpy6MRiHjNDJXIY6PPcPkeX6uk9Rf4z4eM8vLW1
	 phInflPkqFN8EFArkn+j1lnXCkszdsHnasPdEpgR5G3A/ISiqm0GSSHT00Q1OHKQ+rWCX
	 6xBWl27SfVlhNqYfsd6ORhm3TueA0qrXnDpVvbf1VjpYesx1l4Rs3lzsNlwJkhLsCiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wkCip4Oz;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D153460A2639
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D153460A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wkCip4Oz
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so546430f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019395; x=1795624195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rpi69KOE+RewZqGKWGe5fV1itNLcgLER2USO6GkvbTk=;
        b=wkCip4OzUWNZYLZ0v70NTtpvMUaclfhuWjrxWTLDEGCobEuISEM1r/1YXykE8OrNES
         sSdavPDScTpLIcsD42OOVDB8cBA/7n3a0ejFiNtH6Ox0hcrp0r4VRC+t9RqaxxYg0Emq
         jSqHByUX5gg+PCTLUQmXZp0Hcem1t/7WI5dAFC3KPqOUHPE6ZBUJ9AI3zLmVexSX3sYp
         NzzpfGaM2pY6RMKpRjJAWC5d3ESM2Ozxv4Jo/p9EKA7lW81Zcu5FJDnvs2lhXYx0Bhq5
         CLjSKrmZhexYRs8/Dk1HYu3cSv6M+uOSsWUfNMwBoOhQyE7UI0GZmke1n6O5v2HyLg5h
         smhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019395; x=1795624195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rpi69KOE+RewZqGKWGe5fV1itNLcgLER2USO6GkvbTk=;
        b=DizRDXTiZb+LgUyAIPOeIa6230eB6JpOg9SK1oQUWLw/MBrcy+i+L94t/QdP3phVCk
         FpNoBMMJwjHKDvQmNfks42ytjUkJ3jj1Zs16QF2WtOIWWDEnNkyOXZ9HjO0lue2pPOQp
         jOctaLtpF70CUQblzsaaXh+gB6PKhunq0nwOyHD03zjaIY85lxSiUNwPrwgboNwDlZ3h
         OiBcAQpIr9iS2l8PUldQy1cbfKl6v88qy/OMU2AsZInuiuyuhwc2hoBl5QQ81NadMIU1
         u2LoQN8gPkoI9f1HB+fYlJyiZ4MAEN4/Aif2nrVCDBfpzKZ5550GrmYW0ZAd2cWjtA+t
         FbXg==
X-Forwarded-Encrypted: i=1; AL+hErH2osWLUkmAcBCAnPklgxfFaAbNPKSuKT0+ipXaT4bDcnFLbtaigje6tRsstPjeRwGS4KXxYVhwjdEIufw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gaAWA234G5LXofBgdJxXqEVyJq4tbt5iaphLJ+WG4RQikNipz
	y06GhaPWy+BwoYaOTFwQshquiqfel7SGjRMhjWtxo5woFNul/qsJiN66ZNZDcvjQZk4=
X-Gm-Gg: AZFdTZf1bXMVxA0eTW/SvbKi/MAH0vMPB52wkBTvudIWjj2v9pcqQsYDlCysGfY8XT3
	rHVmuyXDllE1pwluiHE5WqkEPqV3c2XRuv1/ZRJu+Q3nUVDRjeFe4/g2rVCu3ez9Xd+4ZhDgntu
	78vaD4qqED/B/3vnUGfNs8lG+tHW7lxtMbzWtAgOKkrmjv4QQhuEEVTPq3+g2Ke76CNS9NR9eZ0
	imXjw2r+/8Oy3RIZm0ODVbjwym+a7VguRdff2TFaTDV8uJa9hZx7hqVhzjs0umjiHCjl74aT1WQ
	qgUxlcYMg4ejc+YL0ahR2eLGqpy5bh9UnENQtZFhc0cz2uqSvYgtUx0J1rbWvNIYfjflQn8Hfoc
	pH8d5EBILCi4bYOlQBvancqmVwVYOhEJRvzXFa/mCQRej75ue//oCuwFNMBPFSsyFRrm/neE0Zl
	6WWP+Zktdl8QSBgOw3Bq48dfBQ9OSlj0o8yINTpvSGoF+puHlRd5pxB543AlMAjIcrumivV8eeM
	yJl4dUMgtYdIPaKNteqe9OxE90rt9FvTQYdW/4scxw/3S/qSFU6hrw+aamtVzlgXJbJ2CvFmlG0
	sM96oNqhIqGUkRa79am7/4OPO6Z9St5Yaw==
X-Received: by 2002:a05:6000:1a8d:b0:493:c0a:507d with SMTP id ffacd0b85a97d-4a63648e24fmr6898857f8f.1.1795019395221;
        Wed, 18 Nov 2026 08:29:55 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:29:54 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:29 +0000
Subject: [PATCH 07/34] perf build-id: Cache the vDSO in build ID mmap mode
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-7-dad4d90747f6@linaro.org>
References: <20261118-james-coresight-jit-v1-0-dad4d90747f6@linaro.org>
In-Reply-To: <20261118-james-coresight-jit-v1-0-dad4d90747f6@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
 Leo Yan <leo.yan@arm.com>, Amir Ayupov <aaupov@fb.com>, 
 Suyash Mahar <smahar@meta.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

Since --buildid-mmap became the default, perf record doesn't add the
vDSO to the build ID cache. Caching a DSO requires its build ID, but the
vDSO doesn't have a file so the kernel can't add one to its mmap event.
Build IDs that are missing from mmap events were previously read when
writing the build ID table to the header, but the table isn't written
in build ID mmap mode.

This breaks decoding of hardware trace through the vDSO after perf
inject -b. Inject adds a build ID for the vDSO, so perf script looks it
up in the build ID cache and can't find it:

  CS ETM Trace: Debug data not found for address 0xffff95edb310 in [vdso]

Fix it by reading the vDSO's build ID from perf's copy of the vDSO
before caching it.

Fixes: 53b00ff358dc ("perf record: Make --buildid-mmap the default")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/build-id.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/perf/util/build-id.c b/tools/perf/util/build-id.c
index 02233ef0eaff..cc813f421c9b 100644
--- a/tools/perf/util/build-id.c
+++ b/tools/perf/util/build-id.c
@@ -886,6 +886,18 @@ static int dso__cache_build_id(struct dso *dso, struct machine *machine,
 	char *allocated_name = NULL;
 	int ret = 0;
 
+	/*
+	 * The kernel can't add the vDSO's build ID to mmap events because it
+	 * doesn't have a file, so read it from the copy that perf made. That
+	 * copy is of the host's vDSO, so it can't be used for guests.
+	 */
+	if (is_vdso && machine__is_host(machine) && !dso__has_build_id(dso)) {
+		struct build_id bid = { .size = 0, };
+
+		if (filename__read_build_id(name, &bid) > 0)
+			dso__set_build_id(dso, &bid);
+	}
+
 	if (!dso__has_build_id(dso) || !dso__hit(dso))
 		return 0;
 

-- 
2.43.0

