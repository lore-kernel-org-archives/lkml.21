Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795857994;
	b=BfaMBNo0PFW8zA5n+F6lBQ3hBFv+QBj+RBBNn1EscmkJ4JoR7kyQgGDX3EKNoS1iTYXc
	 10Aoda/9DoSLam8cxHCw38YsqLE0Fwt0IcxDg78wfLMYBs3Enew3tQEy7+vrbV22roQsp
	 WQY5/olKt15Z9suaXaduMDB07BH1a33jWC883qzUVScZUof4ieX2QNvHjAfyKmJB+YU57
	 8WO8gPp49EWm2dv/B9KjF+DNNIk/apZkQEHExF+NXYheq4Z6ny3nAicYS252G1mwXAfBR
	 o2pFdxElkrIJs8LkKllFJlj3D0zt6nVOY3ioy2Ry/fKXm48P4oOGnkf4d9nRugqZIHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795857994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=OnOWml3mTVLZIAGAoGH3YhBUUwiS9xiwWGOu15WvauQ=;
	b=uRZG479/Dpqf3RrVzArXt2Bnp00C5v8owmV+h0y9x6/fD1G5Nwf9/ttOlkwDDUcX1a5G
	 5G1LDLTqOjUu3MShTqqQ1eQebNzfwF3PKzsE86TMEk7WFQ5arc0gp41o6ivYHxL5/Peio
	 4aWATPn9LVBnCxwoPl95MOYV70Bt0c+pvzTycfmy0mUjT/uWdYjO/oIR78e0hhhsiPxSX
	 bELb6m6mDxZ1Dsq9UMlvKzqftxRC6tGI3RxhyZqASvUwDIjPuvS2VWIg70mmYJm40H9TR
	 TpShkjsihEm3uEgmyVqD829JOnW7t0tu0FkMZmwt53z6y7blN+hh5nQqjgmVqYgXH3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=RenUamNs;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F324B606A331
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F324B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=RenUamNs
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-679a2b5fe87so8067228d50.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795857993; x=1796462793; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OnOWml3mTVLZIAGAoGH3YhBUUwiS9xiwWGOu15WvauQ=;
        b=RenUamNsZf0xZ6eO1WeyNy11Agw4rs/wJlNssAvZQda8EvImKO0psk1oR6MFuztTKT
         fFHZr+48kcr+/NDoo4WJsmi37/dKrYzsCrQdukW2rPE8x10PBn2nLB7aFOXbFI1QXWXm
         qL1KccP6c806B7SP3egqhmBTkxqjumJaJZYDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795857993; x=1796462793;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OnOWml3mTVLZIAGAoGH3YhBUUwiS9xiwWGOu15WvauQ=;
        b=yH3u9YLSXngEGFt0rRO7Vb+ZQRVYwA1JXrT6bfaxgLEV3q/t6rqt6cyUPSa5FYCA78
         RejSQ9xKKLnDy01jUgetG7WYWLy0HTpsOsRwa2jylhIcIlwbw0LwcT9jvKaVDcW3/exx
         Qpbrsod+bv1Mm0Kss8rmn2XL2RVgXw59NIGWd/NQ1X26I54Ztnh7cVY4Xe0sj4ZrnhwO
         Kj4eiQ0PmYqR1n7ifKlfR7sAoNb61f82r/0WegGWtDicfV6buH+yPmJ7UJrvpfX2vtEm
         FvFF8xaPB8QbR1Jwo1MiUwItmuYXjzU4BPQgKO/yAAnh29kmGopBR+PQ2M+3H/ceFrMI
         L0Qg==
X-Forwarded-Encrypted: i=1; AL+hErHaiuI7+Mplesrl9UN1HoZe6vH7HL54x/QwSmwNC6KKyDabjJJvUXDd6UNECAGJwnMO9D93bqczcm4dy1Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YL8xh+Hw46+fRmQ8Szunf0x78yDwLKOMB5Jmg9Tefc/v/eNLD
	4DzvzxEu1oGspPVgkntyAz9lBapdFvbWqma2NLzoQgKG8qgldEmdDnDyZrHYJSogoUc=
X-Gm-Gg: AZFdTZfDn91gA1FKb9bMO2/w5TD8a5Z1BEFvu0lkAFZ6NFO5gCd/4+HlP6uS9gkriw7
	Cg2YSZhIhxq58Nqb9hCLmNhenWpOCew6olvB5AOzgWYke9jcRo6ON3/KbqzB0lHtILJq88qmum8
	VKtuufOAEcyi3OK9o42k/L0JSBT/pViSu7IpBbOt9mYiGhzCCgTikPOdxFIoG9ueFkijxM088Ge
	uFpNn/emf1oJpjV/Er+DNYQKOSvqgrYJJXmlpHMq/EWkCuubwcwmY2pHH4gNtdwO+HmAxcAkUvV
	tEAItvH55bXWOcb4Z+22ci+HRAQ1RQM5ON+UVK8YFEP8USfY1Msi9cUFLD9HUKp6IQxXC7etMdX
	SS9ipKyD5FRUKMicvEo+JvMFtsZogEhkVI2xC+IG+ODZBJqmweWYmeOn/f8rQ+9rBh8w7eXeAwn
	Ttg2nxZF64tYfaqkpzMLPVOgJ8iT9uuyfVYfJN5uVQoyIpptA/6LIxxz50pbK0Wlp5mxWuUVhPi
	VgkL3k6Jng6yAGWLaReNE8MLZ18ZQIxCDou4yAAsmMrQi+msVGAu/8+u7efDBIxdcu9MzwKjfUH
	u55Y1oqRrNeRUyUVpNL8C8+SaPt7NZSnWua7PqZGAOBaWcxLMrzFdq7Hw7XNNMHSgqweJDRDI8w
	O+cjTrC1LcnyYBr0mGc/9ppzoZrLmYGDV8Afz8NTGXAsCwspqhijliccVOtHuItzk27+lGthQUN
	3sDLS3l6Sj18TA1EVt1nPgB5zmrGW3su/+WpSFgHe4JVUREmDYhsJCYo3QuL5d3nzGkYAUge/wd
	vyPRFG5VxGXxGXod9S4qnY=
X-Received: by 2002:a05:690e:12c7:b0:679:2c7b:de5f with SMTP id 956f58d0204a3-67e314d4c18mr6074586d50.159.1795857993009;
        Sat, 28 Nov 2026 01:26:33 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33105fesm12336153d50.7.2026.11.28.01.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:26:32 -0800 (PST)
Date: Sat, 28 Nov 2026 01:26:31 -0800
Message-ID: <e8d703511f446b850bbdbc0e26ca5e53e6672b4c.1795842371.git.chris@chrisdown.name>
In-Reply-To: <cover.1795842371.git.chris@chrisdown.name>
References: <cover.1795842371.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 1/5] scsi: sd: Fix stale max_hw_wzeroes_unmap_sectors after
 a mode change
To: "Martin K. Petersen" <mkp@kernel.org>,
    "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Cc: Christoph Hellwig <hch@lst.de>,
    linux-scsi@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

sd_config_write_same() sets max_hw_wzeroes_unmap_sectors when the
zeroing mode requires unmap. However, it does not clear it later. If
the mode changes to one that doesn't unmap, the old value stays, and
the queue still reports that write zeroes will unmap.

blk_validate_limits() also wants max_hw_wzeroes_unmap_sectors to be
either zero or equal to max_write_zeroes_sectors. This means that if
the write zeroes limit changes as well, the whole update is rejected
and none of the new limits are applied.

This can already be triggered from sysfs. On a disk that was in one of
the unmap modes, writing "write" to zeroing_mode and then 0 to
max_write_same_blocks makes that store fail with -EINVAL. From that
point forward, so does the limits update in each revalidate. The next
patch makes the zeroing mode depend on the capacity as well, and then
resizing a disk can trigger it too.

So, let's clear the limit when the mode doesn't unmap.

Fixes: 6dffe079fe36 ("scsi: sd: set max_hw_wzeroes_unmap_sectors if device supports SD_ZERO_*_UNMAP")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 drivers/scsi/sd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index dc45df819c42..c7018a5de847 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -1249,6 +1249,8 @@ out:
 	    sdkp->zeroing_mode == SD_ZERO_WS10_UNMAP)
 		lim->max_hw_wzeroes_unmap_sectors =
 				lim->max_write_zeroes_sectors;
+	else
+		lim->max_hw_wzeroes_unmap_sectors = 0;
 }
 
 static blk_status_t sd_setup_flush_cmnd(struct scsi_cmnd *cmd)
-- 
2.56.1

