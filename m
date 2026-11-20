Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175060;
	b=03c39CXg0jk8EWx3W+yH/9gOr8PAsYOBhWlD5pmtE8GUurdCgdp/hLOTeOQYP3yeGp2g
	 Yl3/ZSeN3ZmrMa5qnxsWAl69Nu6sfHAZh7o6ad6v7EqWlqJ5JL98FRX9F0lhmMpXc2gJG
	 Rq+3vgewapmoXoqRNi2Ld19CLgjQ8AH8AeGzPbao4AWzTmlpdCGmaUKbgHoW2uBokBaL4
	 fxa1H30LJUBU0JkzCAFZmlDwGuRxRnuXgmaqo+jMtHMf99TIfl2mxPrNg8f9f5XEtpoVA
	 4I8/nnB+SPX26whnfXV7q1scrIBX14pvWT8OQca9Zjm0CkkcmrwQir4tdSEuBnCcznQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=QkFRpq+JqVl3CgqxrgMexsAA7SJ5z2muFrI47UuRcq4=;
	b=LRR64yWLT8OOtDsHp/DcymNhVQCUE+NJgW0Pjfz4Mk21Z+5i9LDNPEMMefJfPY06ko0y
	 A1E+KSULSZIib9/5yC2IoWmtigS+OqrBSiqdOsAZISYbUx9kEMSPCfTYPwbHmZmljcErO
	 cBSoRsJ1MAH1dkl+sXAykjHwO+q54h8M2TmWOTtJHjkI/DXo40//1ynr5jUpDuWykoA7D
	 VSSNDS1UC089BGd+qFfogFa3Qo4gUNdXBR4ATr9jNGd4H1K3+0ufow/JZuvb2Sp4XxLFa
	 x1NVC84RjgZgm0nn2MxH2/HxZtCeHs95kAfhsMRlHZMWsu94qp2npHlOYhJtwO1j9tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="o/gBGgC8";
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FC760A2607
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54FC760A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=o/gBGgC8
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b4021b572dso599783a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795175060; x=1795779860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QkFRpq+JqVl3CgqxrgMexsAA7SJ5z2muFrI47UuRcq4=;
        b=o/gBGgC8Lzuc9gh4fq96uHZkN7m4MpasjT+ETjgkIxxlwvU0Dddf4TCQ0DZubwVN0Y
         AAMbaQ9/O+JykOkkFA5weEJwP0ZPL0m72JMrhhT2MIssvKhl5rJD/Frkq9XdUg04MpKJ
         0zoKKpj81fgmfT6BkF2c6TuB1oGYsnaMduO/sRxBGooFRwvO8pLpC1L6avkoueQpMRn5
         g48kD6k9DAcdoFZIwspVHeKUXIzPOl073uib18GmZkRF9/VpzwH+R7wttXMxrRHBRS+A
         p9THGYDu6JpdwiqOcGor8D9QA5ICLUuMLP3aM2IJnKEQb/TLp0iJbeliY/YHu0F1CphA
         5cDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175060; x=1795779860;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkFRpq+JqVl3CgqxrgMexsAA7SJ5z2muFrI47UuRcq4=;
        b=FZlLMxI+mPFbb2DJd7o8cUxRffuh0OcBM2f7BynTN+v2Rg1ynbbDsOQDXSjtymFvyU
         CiqySydmatQJAmjO3L5RIG7iTygz4gD59vhVFKMW9zuMIaUGB6k2DmASj+Dr4N2CwNeG
         XeUDXuzTfwLa7qHozJidg1Bch3d0kbK8u3bG5jU4bSDkJjsTRL1XmrezFcLf9Lz8+xpm
         cS3G45NdkzvG+lLTmVcyUCU6MsAWmoklnLkfZwwy5aSsSLm31tZvaUR6yUJvzIuZ+Av0
         TFpROiFBaVl5m1ULSHCuGSFrlrQyOMvFlI435Bm3TOs5buRqp/voTY0KMsv6vj28Ysek
         jaIA==
X-Forwarded-Encrypted: i=1; AL+hErHz1C3Mp8YUkpLehTeNZYU6Lamg4JbEubaC8rA3vbP7yv8wTS91y5Co/WT9xAuP2rCX1TASXZT9618WAxQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hy9rkrwQZ3zoggpJNk2TESCSaWsoS7yUqWp8jvXReoYBp963t
	0vesc7QeoCfJnwluomH11faHI5kwglqtf/lSGYY9hPFpr7Mqd5sZ87ZGc17fp1tlFzg=
X-Gm-Gg: AZFdTZcPE+8GCX8qrNWEvQqa4ffmUs99rLFdQIMiJHyNoDMYes7AZTnl15FBQNmUeIX
	mn9z06CbkHn+krVxu+dDF8kPVj65WLnX3kcYlKjJlNERqCLHxOAq0UGqyJNydyiUQcvjfbMdvca
	Y+Q0JNQsHf55IC3d6LMDHxYm07p16cc73mfu20wxoTUsP3joVl9cz6NZFssXfAmff0CZSl5kYEa
	QLRxLryMM9nmOQxAkbb1Dbdt5XPh5KKpnccNwyCXgAFFM4jGNAqUbJG2V9FbgHh9wmdVhvttgp6
	MEc1iPk1gk3JNDyh2fcD/HCPFID/ofAGdHMYluq86rSVnhDe7II+SsH4t6xWsp5z+R/bSLgPkAw
	C8y50+73mGUat+pOGvjLYEE5DdFXVL749zmVxct6xfoe+5xY4ZNOIMCcaKr+k9sXdkR5gColUIM
	5HxB/OKRFKUH2T8BC2guua1YcKd9wWXiyAR/VgLBG5O/Wvj6VsCkUWAy5oy2GmUIJ34N2gUg5lf
	v4W+64+DgqGd3pjI4AKG3oe7RYRKADe61QAMutUEcflHdIhl/rHXvFCfFoV3ioLOJz3zWlEmn71
	AA0UD+940liTJ4TbXKLNtzB49ermVnlfJrafZooF+48/D6fZoLmz4LXCgbbT70jNGJfSrkpkh1Y
	Aruale4hS2CXLJ4dKEmtu6T/blULVSx7RYGecLbUSZpjQsLzYKiRJVLKYDw==
X-Received: by 2002:a17:90a:ec88:b0:3b4:127a:2bb9 with SMTP id 98e67ed59e1d1-3b41c8d9275mr2608546a91.13.1795175059819;
        Fri, 20 Nov 2026 03:44:19 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578dca0sm7448439a91.2.2026.11.20.03.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:44:19 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] scsi: aic94xx: validate the indices the sequencer supplies
Date: Fri, 20 Nov 2026 20:44:14 +0900
Message-ID: <20261120114414.3072572-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015081935.4168771-1-yhlee@isslab.korea.ac.kr>
References: <20261015081935.4168771-1-yhlee@isslab.korea.ac.kr>
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
  https://lore.kernel.org/all/20261015091747.4184349-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
