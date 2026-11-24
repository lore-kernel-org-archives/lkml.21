Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504490;
	b=ZTv03ja2mZIMUSExdSk1Ac87XINl8QdhlCrV9A2PY+JLqTNPfWgFiusAO/ljSXyolr4h
	 /+4c0a7zp01ngDfDx8F7h9AahT/1X8AERjj58Ite+rlurCIOXRoI3tnSdnMcGqGFM1G+I
	 tRfNBUG+BNBzWcFONr2UWWLPOvaFJYgtALzHWbKk2DtbIHbguwIILf9RBQ+aBrPv5Oha6
	 toXMbNmhVBr4s4l/M/eVoqfHTC+IZt0TJNE00qBjkOejLEl1RcPAXX/sRbMks8jqmTntq
	 dvvu5jCwwPMPV1j2x9W4OWrbe0WDQ8awE8JheVTnAIBnuJDR+fkVad+3ejrrB2gf39w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gSjTt3ALXyni33E6d0QmH2wWXxYQFnDYDl0AqS0EzrQ=;
	b=IZtzLikwNJGKCvDLTHaB4Rl7cVlHi1H0xflJhBWR07q4962GFMCS921+6ENqnPOkj2Qt
	 pWCmwYv9+A75GuKwSiJWN2IFNdD0oDqQWD6Rhfu2L7fxWZKMXYkDsJRZZgnBp0Xb63OON
	 pZhd6Y0Rh3qv1gICBsd/nblbJ6OEQdyLywBM1i4yI976ugWJOeRyiu+XH/rFkgiTuIC3w
	 5VgRSMMEU7n4l+Q7funJnTPpnf2VDPUalzj+zVWOZu1UNGe2n5rygpdag9SQJlG+b6ht/
	 QpgyKbI3UTi+pPxsym00VForAGV4gV9Af8AtWhM2/RjOM/sOZ27VPKtmQEPpLaWi4TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dFv1uL6K;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EC6606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51EC6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dFv1uL6K
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdab938dc83so1676493a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795504490; x=1796109290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSjTt3ALXyni33E6d0QmH2wWXxYQFnDYDl0AqS0EzrQ=;
        b=dFv1uL6Kn5kU0ADRz3uAUc8fd6w8aMe5iidaIcGh80lqez4E+FSnN0Ekwkxsfq288v
         dY7ko/Wlojyef1TTlXltGr4UVkYdjQcrIOL+xVq1Pl4miA5nV6SFBs4FD/2Ug/Las4om
         Shd27J/b8M7VGiKrmIvm6PMyt8YMss3JBVHxBFwts00Xjsr1kFGWmdU8m6eW7XxKKURV
         IrxrLSkI7jY0lMidUlmKd8QDREIAhYZTmvwk7IYV1/L/+AFyNxVEJxPnmkBBdfRmMy3v
         My+FduBaUSQ+D1Ri/psnEiAmPcSwrR5fsfxKbWd1NxWZhDi5nay8RTDkLCepHc9cEgcV
         OUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795504490; x=1796109290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gSjTt3ALXyni33E6d0QmH2wWXxYQFnDYDl0AqS0EzrQ=;
        b=k4/h+Etg2ikQWdGaGfcXGpPXtmPKaDuzcocs2spk2QMFu/aOQbis2bUmgIMGJRMm7k
         HW29WKX9hQ2xI5WcfPCSDuWG3J7ckwWaA0C1i38LgqwwwK/xuY1I8Eadh/7llcGYd0SO
         wPtgI+ycgU4UygmV/mtEeXJUv4EclWlX/kJr0zZ3n/F8RDrxcsV/t48dCHWSqFI3cXy5
         IgKYx/RvyhxbEFqc6JGzb6xsC9+zy9ocLqvb2sZi4UD+w+iyb6DW7hFuKTxTxLdrub54
         hqzO1pGoI8taV8DV9Pb23Ato20o/V9VKsavRJZoh+Tc3lLyRT/+p0H3u9izHt99Qdwh4
         mVEQ==
X-Forwarded-Encrypted: i=1; AL+hErFd1JHoCTOgZsPmCRaYptcN/JYSE7Sxy3Q7zF/nggVPGKdKxW2p4jQAl+1NAiZlFe4Ocjpr+o+JG5RxRG0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WhqJz/b+vC0MDFAbFkGF43gbNRDwobEFxxARQdOVIzQcoFqfc
	UazHvXbs9OyisDxoTHg7SbV4CW4yp08/dnPPhrdMJywY2LvKPu9tnXlpeVgcSkZ+
X-Gm-Gg: AZFdTZdtv4Jaa19XLrYn4CkWfBxGm6+hrtvFPCFx9THW5E8c4J1aWigjChisP6vLIpc
	bcQWEo4QG79XKbdvfN3V0aqVBeoV6deYvlRoHcehmqkdLjrvA5VHdM+D08Kvz//DWPNYnoZB7WB
	TDjA5OlOSS8kWsHYU62oITl8jkkedNt/Df+lNIlbKjTiq98BKVUg8wwVyURXVZ+mtsGE5azIKUW
	FOtfN864sUJcx0jiz/cRP4h6/2CWSUTBy4O9FEn15o0E0N25ssVmjrII9KclhpPI3bUk+NxMgbb
	Mo2boXsfJs5j8+Z9H+vFw48YFt2l25rKbCnvpfbewseDtomvwFvA9cdBTUld6E6I1CuubbGXBe2
	xTH1e9CSVnqThPTsYX5pBfeZ7HHxtNhif3027dFHHy5QnNWZeLMgOSLVN7JVI/3YMcqzO+NWjas
	/g7/98kFX5DWsXhoLTSJInxCXw+ruqyCioi2c9Ykxj2VuRKLcH/xLlkWMl9vllKFm1nUWB6bV+i
	/fBDebLzwRmCvWA1ZmCzZHYixi9ImYQEuzBMQq93XAidHZVldeczo00XmQyXSY31NGzGkugCmRl
	Qgbk3BEBJMMI4wyhRvkbp4FBVISLi1OnCJiWNjO8SidTutCU
X-Received: by 2002:a17:90b:2f8f:b0:3ac:9d14:feb2 with SMTP id 98e67ed59e1d1-3b41c933eefmr12609949a91.35.1795504489447;
        Mon, 23 Nov 2026 23:14:49 -0800 (PST)
Received: from embedsky001.tail6d6b2f.ts.net ([183.13.19.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfcadffsm6475836a12.9.2026.11.23.23.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:14:49 -0800 (PST)
From: Yonghao Zhang <hyz3367@gmail.com>
To: mathieu.poirier@linaro.org,
	andersson@kernel.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yonghao Zhang <hyz3367@gmail.com>
Subject: [PATCH v2 2/4] remoteproc: core: Guard against a missing stop() in rproc_start()
Date: Tue, 24 Nov 2026 15:14:07 +0800
Message-Id: <20261124071409.972-3-hyz3367@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124071409.972-1-hyz3367@gmail.com>
References: <20261124071409.972-1-hyz3367@gmail.com>
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

When the subdevice registration fails after a successful ops->start(),
rproc_start() unrolls with an unconditional ops->stop() call: an
implementation without stop() turns that error path into a NULL
dereference, and there is no other way to undo a start once the
processor is up.

Nothing rules that implementation out.  rproc_validate() checks the
callbacks against the state a processor registers in: start() for
an offline one, attach() for a detached one, which never look at
stop(); the only written rule, Documentation/staging/remoteproc.rst
("Every remoteproc implementation should at least provide the ->start
and ->stop handlers"), is a should the core does not enforce.  The
in-tree implementations all provide both, or neither when they only
attach (commit 1168af40b1ad ("remoteproc: k3-r5: Add support for
IPC-only mode for all R5Fs")), so none of them can reach the call
today.

Skip the rollback call when there is no stop(): with nothing to roll
the start back with, the processor stays running and the failure is
reported by the boot attempt itself.

Fixes: 7bdc9650f036 ("remoteproc: Introduce subdevices")
Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
---
 drivers/remoteproc/remoteproc_core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index b6fe74d34e5c..e44b45510b4e 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1310,7 +1310,10 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	if (ret) {
 		dev_err(dev, "failed to probe subdevices for %s: %d\n",
 			rproc->name, ret);
-		goto stop_rproc;
+		if (rproc->ops->stop)
+			goto stop_rproc;
+		dev_err(dev, "can't roll %s back: no stop()\n", rproc->name);
+		goto unprepare_subdevices;
 	}
 
 	rproc->state = RPROC_RUNNING;
-- 
2.34.1

