Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174991;
	b=nBYi6q8GHvoCDCbREmHst+BeZ9RC/V7MUu0LFpDM3Gb4ml69tKyKCf5t72m9PFaeKRsV
	 0Mkr6gjwgB2Jo8JC6x94mTKKa5iDWyFy3qaQOnc6CZXIIhWorm8g0p4qERueJ+Lln/V/x
	 moK4lkeypVHPtP3O880gzeq50QiC8xOshi0Inht42FanvbPlRxCna4N1iKTOEExAtwJUH
	 m9xQdSuo1WzqfYkSly4Xfg/T+laH1Tp39amCycE+n9wOWLTDEX0TSdB/gvr0eIoXTz1yQ
	 8xbj4puy0WHKdIq3q1HNoKVaoxzP5O1fOQp+McuJtTz3LPMuh2PB4hS5h2n8rWpp4yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=tjGZ/Gq7+UhVAkNckCXeXj9Z4u/UvTe6D1SHPI36wK0=;
	b=X0dGL/n7CkjJeF3wqn7EjZ9SRqf02ki0EhWLjePv9C1dTp2VQdYqWPwT7CEucNayDjX0
	 TD0+YQ5Gc7bTJrGE8ubSuOLaw4UpvERbMcyZtgwSDTOMdXl954H8PiHNV0OhlmefTXSp2
	 0Tyd6H66HI0aD8ntN0RrzwB19M7MNrDo5mA1W6UzGoi7xcUlNP9jnZoy64fnMg7biqPNh
	 eWWDEwjWMRmCMezNmfMdXTrWx3NLT6P1TUXmtbqj0z0ElgddFr7s/IxTcDdeY3EQSmv1x
	 KswMV8oKbNSwTW4T5J8bWlnODFdaaC1N1vnAN75NwA3YJsWpY9uYshSFm4zZB6Pkp6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZxUf+WvL;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0204606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0204606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZxUf+WvL
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b3d4d3bba3so466436a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174990; x=1795779790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tjGZ/Gq7+UhVAkNckCXeXj9Z4u/UvTe6D1SHPI36wK0=;
        b=ZxUf+WvLCf/dJltRY0rSyC725l+Niuz7njCp3qqzff0KKwxSKHA3Xh4lK0PG3fMPnb
         7+iZHju9fGufQJE2QlXpD7DsdGTcv+tp3OOQyDxYLF3tBC04VnKz9Zsar9RaaiAnbzDk
         fzNe6cfAr9JJtFXRYCDb03ECP4Se9nWPRDsQaT/4TSiylTdgycfKANbiwDstAkepKmbR
         kD1dF9m58LSVjuBz+gyxfo2BkC3lznj7PutgbrNNJ9fZ+79dwYEW/opbrTTJLsfQx1Da
         Va6yGKX2c2IilH+m1PYi3MaAbcSgyvIvBXKLLqqZRKguv3sQUV843xKXo5KSfxlsjDdv
         GH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174990; x=1795779790;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tjGZ/Gq7+UhVAkNckCXeXj9Z4u/UvTe6D1SHPI36wK0=;
        b=SsNgUq/6On4AOj4paL3JpIFfiSd0hzKzB1+oeP38vAHu6oOUFwz0zDQk/8F4Fa3lo9
         0qNTeTxxnk6xOLdfYRer7c/s7UBKuOUen14UauMk45jDyUerEws151DXf63QZ7CYi1CU
         qWoKKCl571wOXtqKzxOIGxTkbGpXnGgdlq4O8Pj77f2O3+C2159anW0hGNNZ+/iWENwD
         bgM9XjTXPDYPDHET+rXqTd3FXXlUGK7b/KP6oQ6wAqmR1/9lCf+hsg3oFMBoC2SHFlTw
         odNbcR1N+FtxsaFQU9oihncRCnkJUKcVvZDZh7MqX9x5m+y/8BFPY4/5xb1XKPpROtZZ
         43dA==
X-Forwarded-Encrypted: i=1; AL+hErHKS8wfz86sv1VL/WTUDFuul7b1n1mRc1dn8F1YeoVyJQZlxFPkSfAL/8qzKHaCueXaERQISr9/KidiHbo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8kZg6LHbkaM+rQh8bybTT7O0kyb50qdoUErs+qWOY63XLZW1d
	Tsnrk2Blnu0kupSSwIJ/ftACGyFuX0oHrarLAmjRMcZOzbxCmp9AuymJAgd9pG4cOGA=
X-Gm-Gg: AZFdTZd303MtxsGxETl05raegmiP7LStKMgdijvspx3usbTFqIhalZda+su3iZ0rR9C
	DQtISa2lW5GxTxMO8Lih6Pt2+vK4DDnlX/iDwpLQ79b7SZVzup4zePAf7EQcgHDutKeBU/9Rhm4
	mCYaU3QPYCgTR0j/YCoWiOWGBqwOfphV/VT0J3/YL3hD6FDKib1XEl3tqHITqxnV4PfL3hsARXS
	3aQbE6W6wTnQ6g9CXJm5NhZtlzyh+U7zZFCnHtTFYmxwcfoepkq0bFEz9Ok+P/Cd6/EJv2MHiLD
	po4fR6lB0+h7OyLp4jQ82NHGGKPWEgL9vd7d2RZMbgFbPrd9LY0y/bxpeaQlGsswe/VpMctcVs+
	dfZUvQm5gqPQNqTiLZ/a+WtYl0wWX5CBeoik3SpJFlBQIwsIsGoX5+9gMVzcv7lakDkIs3YrkkT
	AjFMqBGCv5nFV2j6E9qBPrPgCxy0T/EAVoDrz4XPisCzYETBEmm9DN79s1IYCPeU1e1PFgh2Jv3
	ouca2tJIixU/ngyudCczrU6Z00YNbFd7fPgdFvR5/MUas8058P9bFquQRVu+2vCm4ese6CnNhQy
	92fLE4sWfIEUQUYGUVyNOw9HPtmX4tOlv8ax5cWBoZDAeuCqFKX1YUzPAPPsK+MC+Q1XWeK4a/q
	x8i4uLk2fTO6RbtpoooCh4Db18RqtaHmm5Q+N
X-Received: by 2002:a17:90b:3d92:b0:3ac:83c1:2c0 with SMTP id 98e67ed59e1d1-3b41c9b2de6mr2390953a91.64.1795174990371;
        Fri, 20 Nov 2026 03:43:10 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm7041802a91.16.2026.11.20.03.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:43:09 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: ching2048@areca.com.tw
Cc: mkp@kernel.org,
	James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thenzl@redhat.com
Subject: Re: [PATCH 0/3] scsi: arcmsr: bound adapter-supplied completion indices and message lengths
Date: Fri, 20 Nov 2026 20:43:05 +0900
Message-ID: <20261120114305.3072260-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791789900.git.yhlee@isslab.korea.ac.kr>
References: <cover.1791789900.git.yhlee@isslab.korea.ac.kr>
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

This is superseded by v4:
  https://lore.kernel.org/all/20261114033810.549787-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
