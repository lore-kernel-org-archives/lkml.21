Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175024;
	b=mKBhVpmh5bCwl5VNRBnpmKkWSdLSsvRYOcdTubU4juxKbF4mPMECUfHwUENtUFVkCb5x
	 aQXkNced9xSWxIYJYVjdc5oB6GnVAMwGdpsbsXvxpwcOADbHuPR9vYmfdhkJCBuJWPwY9
	 ALopng5/xZI55KsALxz22MJqkwT0c+BEmuh/OwV22ohzbzmZdDN6cxTg6y6UIGj3a9Uo0
	 1svv+k4f4w2LFfieCxwSNuW9x++O0DwTkJ553rORVGlxKiAcFZtJvF7HERgMjIWP8CbHA
	 9NAD7Z7Ob6ZH0HT/3gLJYyTdFa+ePvbSGHBeZou/e9o8lJoiDHS7FOMlZPZEVqebrfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=f40EVFz1rtWKrEF/UhE+GvFPiXhiXKV+B46XullK7uk=;
	b=lwrQoY4z0snQdhH9BpK6LwCb6iozsDceNC2ka8pf9LLkt1qmOE7jqbEkiKAMOUAryd2X
	 keTfxvEKNO9HkWi8I1mVBglAhhwqj8SvPFQVCK7MMlJaq8E4YaBOE7pvLXsM3o8xDaB4q
	 S2/m3c6LqY6j41EQgj3HtEs2tdp0dMVx9I5h+iJHX/kZ1ybdkOD89MK9DlB7IjnB/OZ8I
	 m3AWIb6GTd5f+YduBSR4XGYm09od5viDhsFlbE0kpXihKQsvnPlFmDKizb/Hhk2vLHcwJ
	 4muutFfFPyTPXtC6PMwBbPztlwGTMcDoicP0hx6wFXzw0PAu4WjrMk5oKNgLH3AL+Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sLazAkoS;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A7B60A2607
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41A7B60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sLazAkoS
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so429240b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795175023; x=1795779823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f40EVFz1rtWKrEF/UhE+GvFPiXhiXKV+B46XullK7uk=;
        b=sLazAkoSqoOCbIqm5cyRCTMvTBb5auoEwUi6S31PoEXGsFiOOxqN0c9rIy0/l5heDk
         9/VPa538Qx9u4veHSAF0y0I+TNqb4K3YZFXMrOFrPkMSMHZfS+gs9RhdE6loCR79t652
         msh8I/A+evIg6yWFY+MH0k48sQnIA6bwgndUiQyM2wFbA7YIBftA5heKW/3ngtpStA0k
         ha1wiiYu+37aAMsVqOCUSccgqHxPNPZpuL1Z431YI0+QLpqsgfQwXHooxZkKCxKZE7Le
         SCQ720xIxjULAzwptLYYdjuXVmDVSBjW5RbRzHnOQTNv+3nSk/JLSnCPxTDKPhskqdFA
         PqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175023; x=1795779823;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f40EVFz1rtWKrEF/UhE+GvFPiXhiXKV+B46XullK7uk=;
        b=S/cQhQmxcj9IfaYUnZ0jxotpfu5kkRPWmSElSF19hmQdNLH1sVCP+MeGBcJDhrombp
         /vqJuAzpjxccNxkTHDVHdRZHJmwdGub6T+DApo8Toie2CvfrMlFec/LVipQZ9DpGCz75
         7LSRZOYF3WFB+nUMEA8PdpcOuvcCzbchMhmZ4EUXR7mIeT0lJ7xEmDu1aJ/+/7bzbT44
         p6539K+R3m0Y9Ehm72KkDHT+X8Lz/8JZigpBUakE2yAErFSlPXRJ1V92irOUUaSL7yGR
         IQSdVh8yWtgilPkU9ZTTW1St07tb/IHyDbr9uFkfvRi81U43l99LNXes7+g9PZ2BfJ7h
         KWOg==
X-Forwarded-Encrypted: i=1; AL+hErHxzgr7HKjPg0INkjvtf81dxaXt+NJVDK0k+xLvy3JFSNN4qJtvaAe4gF07SSDN8xfQB2F/a5/zR+MMbAk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZEYonbdtkDU1qyIosqvSggY6f5AAkxVp3u7iFrBy6TxxWTZA/
	44sZPPo0dURArf+JttBYr1dSA1XRxLZYyR3alGCDA7zmUGvTi3gM7OtBugmjaknBCDQAMUI8Cx0
	TJCQlH1M=
X-Gm-Gg: AYBFou18GFMW7bsakwlBeCdi1V9ZwsH7FliKdZxS1E8xiJS2wbsH8WS/lw2JZr5LWmB
	Wj9yhwmSQuig/km87t/u04RFQt55DIGogKvsX2Zqprx86SA+4b7k+X8W2l9bzlvy5Cu6pLwGggo
	UZ5kSXMFGw/SwhwqU1TbMq2z9ijEnNanGV+HmB6HymbU14vUe0Bv71cuvClPQZVx/0yDhtP9x4/
	0NVqlB/SrZ9k4KXg9+VKKRwkq6M9OJS/CRNlif2Y5c1Emp0J8HnF29SS9TyOtkvb2piC1wO9Ben
	h/VF5OrfD12X3ur8VzechN1D+95b0hMzW9yro9a0IoI3YUz1stV9RrMP+8m46Pr+WvXI6FMbeH3
	YArqufYX3N9CqfdHHJ1r+TfJbltca5GrRVgT5sKGREGSvddNxJNNZ2uWTDO82JdlX8i1gZhsUbg
	TZfKC8h4BCSbchYnOHWow4/9zJ4n6yvgNTO3wonQScUu0tfu9ha47jMHAEvDTc0c4XGEAqzn54F
	Kg0LI8hcrtoy1V0mNsL2TleC1ZOFP+9MfV3mLNI0/+jkpx3fvlL1IOXwcQtXIcse4cVmiD8Tx0v
	n3ubHOyAg/bz9zPGUxl6jNaNQGKm3yusKGl8t+2OQvCx84UAASxq2mEdwLajlcaplnsQe7wnQh3
	nepjv9c+4YCpKcHu76Ea5LgEVnCKZ5AhT/hOk
X-Received: by 2002:a05:6a20:914a:b0:3dd:85aa:4526 with SMTP id adf61e73a8af0-4014b5645c4mr2972265637.33.1795175023592;
        Fri, 20 Nov 2026 03:43:43 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c86d821637sm1488388b3a.0.2026.11.20.03.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:43:43 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: mvumi: reject handshake sizes that overflow the list allocations
Date: Fri, 20 Nov 2026 20:43:39 +0900
Message-ID: <20261120114339.3072367-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014004226.3469868-1-yhlee@isslab.korea.ac.kr>
References: <20261014004226.3469868-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v9:
  https://lore.kernel.org/all/20261015045213.3975845-10-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
