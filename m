Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175082;
	b=5VlAxbg/ephH5vEOEvwmGaMFRmkBECZwJYE5OeOopE2RNx7WSZVfCvaiT9l+IPtlthFJ
	 loIXLhXVjiYDac0fCum3Scij50M2aO9GxRu0NJ8mXqf2ZbOrRfTEEVjSuBV4HbCEtpP5n
	 JpUnySmYE8wqg59Rg+lVoOn+cGbhdXkbvjfbMt55jG4iKEsiSGK7X6nwKvFqQWrtjfPk0
	 VMrnJHEk6TQeXXoWA4+aNLkuZP9n1d0Hy6yg6g/URbRW0zpMvDGt0/TQdAcq9yKDyO5ZW
	 1Cln2XS7XoK+wP92N7kRuCQWnuINcR5STI2cAZP8BtVsU6YQwV+BdMHM/RjTBYEPgiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=aQRBgX2VgkOHD0W+Pmya6gBX/CjSVN896aNxZV8p6ww=;
	b=XOAzTBEH9RyIuW2U6lctiK5jZpIMYNk8f3tQhk4KvaP0ivCBbrOzThUdsiAKow43A4jc
	 r+Pz6hBMej1cX4MATluGHwDOBlRdf3rF545VOwM2JMW8ttJp5Jqt6Q1dllr70/X7a3vA9
	 +haBQeYwln5Pt8nIJtcmgYeQ0AS5HTzeMDtV+BfX4ZRmkJjcsvHjWlc8V2y6YlJPFVx4y
	 ekAlGxRFbdpv7AGIiH/c/zTWXLp+Wh+w+m4SyxbyK9jtbadpDLLM56njsN0dAfEodu80Z
	 iWMLwPiQIqZlUKJHyXj7I9Rg1SXT6nMR/FMwNcvc5/u7hs5096iRfn1XoicP4WIq1Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Cnw6IEIq;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE0660A3817
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DE0660A3817
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Cnw6IEIq
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso381282a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795175082; x=1795779882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aQRBgX2VgkOHD0W+Pmya6gBX/CjSVN896aNxZV8p6ww=;
        b=Cnw6IEIq/AktYRV2USksXF7EAwqu0FAGMqTsHjbh4ISE1J/9hGAPLV56F74IWpLNbS
         tc0icoflWo4ZppuV3leeV6Vmabym3n8vhUqcuTasw+E7ZrmYBL0rMjQ9r5+3/LekQ90d
         lDCcjyl8Ta0wrp2/3kM36f8TGrXquEc0Jt9ib2wUGONOQtPswHErvnTwHbStAgMqtNLP
         4D4P0ie1E9C8uLUUTfzzT+7sN4Dpl1E0H+AlCNc3myHGkEK1S9f2UwkOtJOSPlSnmh6M
         Z2pMxzn3vMbwh9TqFwZULQILM4xbGjinH62CLMbG9w4AtqzekZKDCZUczIl6h/H+HrIC
         1mbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175082; x=1795779882;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQRBgX2VgkOHD0W+Pmya6gBX/CjSVN896aNxZV8p6ww=;
        b=RO+sJc7GuyRKEy4zgaIMRIhM2ZsHFEaVXcHJEsY1VzNhD+raI7jJvkr5wFvI78LpPp
         p70nY9KEnxtzJAIBVQs3zL3Y2nwpGXOxVrmSlYwLkMJqsglo8yvKpyczSJe8k5YPyQfv
         ZGy0kDIuCLOTFLwk30EyUEE8UtJWJW8niKE1IrxJwgiMmz2lCM7MF9diSQx1Ats0J4l7
         Q8PeXO4xdfSqKVJbXQMqiHSnMi9hiHrwdblTgtAbG8MVJxQ8DqdclXaDR1xmPNuhqMcJ
         9fS0QYraGn07bXTpm3nfp1GjVbdcPhkSKhtx3hyUV41wqW6RrTAalriOa5k8FfzUkCIc
         4VYQ==
X-Forwarded-Encrypted: i=1; AL+hErEOLN8hDOhKsfHyFhFDJFrPIBo6EkNLyhtuG741FHbRJHuCYvpzfgWtJqH0Crs8eytUl8Sw312lRzRBYRU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yzkH+ElWpB0Ung89kzMc8R0s21McZKLWvBg7nUy0zTUKlsL7U
	RiF3t9oBTwvCxGfXipZ5xpLFITUEgBfopBnJLz7nCtlrM71cGJUbi4ZLrv0y4QmPDNo=
X-Gm-Gg: AZFdTZdZBvGmbBCdANtSD6ZZrDCDYpCFc+F2fEvCpE9NBbK5lXJkCLjhD1MLdxK5VcM
	dSCDwmQPHyODi93pAhhOKuxDMaPfrcPb2TUx7HyDM35BNNZ+5npZvL6qXpgsc5EiM1Y107rGSpH
	c1Y7oCubdI9aeqmgCFfVIhbOguLOdmbWfB9t7wAlhU0sdnUD6kPulxO+63Yzh0ZhosgjJxyhkkz
	ch+M5gyCgS3eGoh6+ww00cJQDYPR7LcJbkvRokOipQU2B9fWcKvG6vlSkMb+XZSD+X/nUUOX+y0
	qkRIhiEY5/l4abmGrFZuOF4IK/TxVuTV3nJefnt++o/bbacjsqFZQ6EwhTpNUjEdb0E1XQhZ4Ru
	IW8Tgnzzqx4nxfK9Eiu4bm7vcVkKWtWLz70w1ENvmxaVJqZ8Lu7XlTiPV0cwyddiG7sffPEowwC
	9KqpbKh5xMxWCOD+rjXSqmp5NxDjBnWRLtTRMzIrcE+G0GvIkAduul68tkFdI9OQneaBXV+8j79
	poq5ou1MIUIgy1m4XhIX/hXkoTOiIuW23Y9Ps5D7tCldWQ6ojy+K0GXTyEpuatbFSqlFBR0Jw2F
	1fuXYmaubqKxugd0M9A3wIQ3aohhJQd7rvWDN404GqmPcDo/EWc2cxfu7RJ0QOTPFk9yk4qvo2U
	Q5kMeLBa4Cd17DHBJM4B/FSV+0qkF6o4OJHzY
X-Received: by 2002:a17:90b:388c:b0:3b4:1877:8d35 with SMTP id 98e67ed59e1d1-3b41c975320mr2681077a91.52.1795175081857;
        Fri, 20 Nov 2026 03:44:41 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm4339969a91.1.2026.11.20.03.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:44:41 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: ram.vegesna@broadcom.com
Cc: dwagner@suse.de,
	mkp@kernel.org,
	jsmart2021@gmail.com,
	hare@suse.de,
	michael.christie@oracle.com,
	James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: elx: efct: hold a node reference across asynchronous session setup
Date: Fri, 20 Nov 2026 20:44:36 +0900
Message-ID: <20261120114436.3072633-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021022209.2580332-1-yhlee@isslab.korea.ac.kr>
References: <20261021022209.2580332-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v3:
  https://lore.kernel.org/all/20261021142818.2782104-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
