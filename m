Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186886;
	b=VYuNGBvSuzaDLRzm4slYb/bqlAZIMFuzt5JdsFrx310tgjJROd1ZJsmqRDWGOyILwDXs
	 FPd7lxEMkPAi1P0ptcTp4HXMkC/TppGcUs9EyLW71GlakD8oEXdEYWUx9taFE9uR/1CQ6
	 TISZ5tKvNr5jHFzqFoUwHEPd6WPjzHkL0iSKUkUD7623PnmO7h+ODtCtq8L1onOgUi+XB
	 MTeawNHWLMBGtXyiNJjSQidfR9oSChs/As8C0w72Z6II9QT3++65iJYTNiJSEz+eWCv4U
	 V8zhPrjBDPHq5H+BIkgVU4qcg4iN8F1rC/Wzhm9oJIofYknX3ugQZ9NTlP2fj5X4K3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=On43ZjoDW4xM+JQZ6p61QSzbWqphWK8UKiGElZsBgt4=;
	b=YZwhQymWSDvbjIRq09+dgINpK1sfkX5jX6Xgaqu2+qOdzq38UtKoA295b1lq4/p/hWos
	 q6EL0BOSQ9Lfb5mBlvJy5sMs4uI2WsxBlwygCpoOipbcYwMvOwIzX0R+jr0KGzJL0zO92
	 cOq8i7x9C1L82oywiVFoSDjrd9KxwbOVCrA8QD6Uu0Xp9Yqko7l6ADvvBE6rRbzOc4beh
	 6mmwgCISUxKg1f5xcv6Uew6kuXMjDwtFng22EGcN8t1x7JqA1Ch8sgZD6T6iXVSQI4HTp
	 uykPNz3L4apahaum6QYln6HT/F6n51jUHp5T5w00WKdXfOLCvxdv8VCKPcbLWZpQosQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GM6oAl9C;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F62606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95F62606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GM6oAl9C
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb628232d2so562747a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186886; x=1795791686; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=On43ZjoDW4xM+JQZ6p61QSzbWqphWK8UKiGElZsBgt4=;
        b=GM6oAl9CFue43yNm9QcWrcuFp1ifdnNPBc3kUji9MzL2NduZ9VNGmQI3xisWK7SKm2
         JnmEtGRAQNCyU4TocLBEn5ziwAOdN2wEdi0f5tRaoYyV+3fcHRDobCCoecOb9wXcsKIq
         A5H/rg6NStaIwPMYUQQRAGO+p9A1zwnustJ55W7Y7L0ACb4noZC0YFsEiYkA2d7UsAx2
         UX2dNi2hy/UCkPbyTHY3x1ZJVZi592IZeIkcSbZFMyDlLam0pYnwINh1ORFHp7SNHHV9
         BDkz+QGo71BCjnEREQC0yWN9NdpVcXXd3HpYq2OBIHp+XRWNuiT9bhidsRRd5tw5wqKX
         YirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186886; x=1795791686;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=On43ZjoDW4xM+JQZ6p61QSzbWqphWK8UKiGElZsBgt4=;
        b=vqRFq2yPsVD67mfxM7mrpuQ7Vdwbh3njI9DlVwMi/3A9xQ9MO3jYzhvF7LN9WwJQf+
         RqMLNZnbLj3gWWyX8tn/KYC83SQqlbCy1z9EnxHeM3Dwhi9rsF1b6j2wZ+RpOgPrug48
         lqQwTClr08jSRQw9z32bUhlo8IQdzFPUmMWGAsoK6C8/NCkl6zV5hnLgDf95AjCcTidR
         0F00zPhB6nOI3Z6lc521/elLhM7cm0NSwHs81fce4gCOS9QI6/3S6UrA73kNa4EZC49/
         g5chS82zPH0cjTln1Dm47noyQM7KGXNKtfpXdK4tar8WQs8xZBitDa+bn6zPpwP9282E
         xCGw==
X-Forwarded-Encrypted: i=1; AL+hErGxxwINcW2N/cB5EicelpPSIQaQQNww0flXXxHrl6AgjTLh2UuASse0kHnfQFPt4olHm3zrOJ9aheLrQpE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/edpirYMQppTKx/5tTuLY15+xwJKbujv/MWxh+MZ0hlGvrpCQY
	DCubtMjt0Nq5RFbeLozN+2IybZ7ptXfw0ZdgwQbmSqEPIBg4Mx94LVGXiRsT6j1vYWo=
X-Gm-Gg: AYBFou3wdT/uhtTVPOf6sA8nPS5zHvf83imdMXepcPABzZkYT0pNm6oiYLg2YW6g+pb
	g2kjtbeO3UfAYeetBcmmcIubbBy7EOhXBh6ZBdevS2Ytf0gx+ehofs173k3sKvohiexnXg1D2Ii
	t7aUCIPXIubHjLmXvLh8TzRjqmYWuetOXucaF44rvflJSsgrh6Go5VuQHoWCwiF1XBtg5y9+oGu
	eRTnOulRrXlrVGa8g6peYR6hb6fFgGZRCyeGTm6gXOxAOY7xZJvAYXs3wSJWLKDR2cScLVUlXTF
	If8Sfre2YDzj3+1kf73jLoZfQ5uUVkBbHfZj69JuD/Q35tXo0/D3eqKnWdniG9qy6jQ196xPKKU
	07hOhzmuJVtI3E37Ey77Yj6H1bO713uVjwSdRYUz4LGkt83P2r4JjrlrD05L5a69EBUl+mjcL2b
	HryMA9lGjLIwZvuhZpONp97ZBFUsirq0bgInjTthFjHEiD4EJqX7n8MCDIElke3z+cmEBHJAuJT
	/1Jat9fBI6PABjAdmVaNBteshnyQSnJNqzLoOGwGcf7aVh1DcafW4dUqP2MDwg69zq7DF67p2Le
	eE2ESvdBgw6u2l24JSmzHIZEr+P8brJ3MIxsX0lZdNzWn4UpdBAeCRyh4k9YAJ3bdYxlVEBBEPa
	AFAEwd+qc/mWNRKwHW3WYAEe9nF5k5FBWdjnz8Tbq0w0r/4jOyU4TTZ0NpQ==
X-Received: by 2002:a05:6a21:6f89:b0:3de:7add:6551 with SMTP id adf61e73a8af0-4014ca444c4mr3490315637.16.1795186885908;
        Fri, 20 Nov 2026 07:01:25 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc6130sm1474521a12.7.2026.11.20.07.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:01:25 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: jgross@suse.com
Cc: sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	martin.petersen@oracle.com
Subject: Re: [PATCH] xen/scsiback: unbind the IRQ before draining in-flight requests
Date: Sat, 21 Nov 2026 00:01:20 +0900
Message-ID: <20261120150120.3128351-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109122654.30859-1-yhlee@isslab.korea.ac.kr>
References: <20261109122654.30859-1-yhlee@isslab.korea.ac.kr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Nov 09, 2026 at 09:26:54PM +0900, Yehyeong Lee wrote:
> scsiback_disconnect() drains the in-flight count before stopping the only
> thing that can raise it.  scsiback_cmd_exec() (xen-scsiback.c:426) runs in
> the backend's threaded IRQ handler, so a request can be admitted just after
> wait_event() has seen zero, and its response is written later from target
> core context by scsiback_send_response() (:347) - after the ring has been
> unmapped, and on the scsiback_remove() path (:1268-1280) after kfree(info).

This is superseded by v2:
  https://lore.kernel.org/all/20261113110036.146860-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
