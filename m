Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795453767;
	b=eCWf79SonnTOtO8cde5gkddRX8XV7ISyq+23mc8CsQZQNBChF395WIyvGwKo2WCobtnL
	 day4MiItafVPRyBAg9MoeL/U9Pxwuq7aLxs2EHQym/3NRusGiA642ZJ5NY9DDv06w2KKI
	 fLobgkY9TPHUrOfA3UlVv6FkuhdtD2umnfP0jzEtRzTdtv0dDmydi4RtKv7gWfff1NbT1
	 HvB4p6aNDJCUcoCAzzyVpnsqCdqQ18CBS3lTcNe8SON5gP7AZ3xVQdNOgtE+Ztd8sxqN2
	 xZj+0kS/AjYJryBL4VfJiXNfPmzdz6FK5/fRYQnmT5DJJrYa9hTALk7649UNH7vPuUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=5t5JP4GO9Laq1Lv8Hq7DQj1ZPWjPnYaLMekX3WEbiFg=;
	b=4xjscFpPEk2gHjiepc12IJqRVnmlYhTqnJc1xZkNIDXXHjzyvyoHiPKhX5J/5xhDa+D7
	 YB/G12GvkyJDdGyxqHLo3RCUsuOFtXyXX4d40qvxTXglgF4CfyPUz6GaysI3IT7itUO8t
	 i1tMyKgTmLDGPSpbAyTojRL8nq6Ry/U8x6IFUmgYEtcpYvHc5ZNGoHOz6S+Z2qMf+6bru
	 ZxRDQhcoFa5gYkYTxzJgpLRTjx0EqqOwW3Ez/BXV4zAjMkdJe+++kPbGuYQBGpHAdhApH
	 Z9IN9grSXi9UUC6CR1KKZM25aSbXpXmDgNxvLTDd4ureN9PJ1Epj/VIS+VS2raTm9ag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qlOPitY2;
	arc=fail smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F80606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2F80606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qlOPitY2
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-475920b9ca2so1157942fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:09:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795453765; cv=none;
        d=google.com; s=arc-20260327;
        b=UiuK7VIqh4IaD92t8gQY2N9nXWmSyOuiYpO7gh+/I17/eX7typlhtAhMr1D3cGX1bK
         eUpPtYEgWuVCxSbqMEkg/YS2+3/JQ+uR9PhC8uTg7CzC7FtNUWhDu5d4dninHuEPEoyo
         B0JwT5cSaHtXh9Lr6fLiid/NvmE7dP1ZWK8sxxkL2dco9rQrgb7XBku/gVnq7aejfUL8
         INU3X/gqp0YBDrXrLZjTA7YFfrFG/6oKFUWYaYWRFXRK59iNB8cPROvrXEj78tJWu+o4
         xFTu9OepRBD4f9/cD+itVX2vufzcVW/aoHDCTyaA16w2lyXOhuYdf4MN8t3Ji2RDfEcL
         sRPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5t5JP4GO9Laq1Lv8Hq7DQj1ZPWjPnYaLMekX3WEbiFg=;
        fh=ojJJHrkIsd3qI9aT/qOQ4UwIU470xRKltQfPqpowwBg=;
        b=KNDGTcS8DTVV5etyQgHNLZcKe72zoWEOe2KgHoDbF0XCHNHM3IF95O9+v31cnmhVUw
         dA+Y9tFOCrK/2LezlyhzsxSjtWkWW76FnqzhmFQ5dAUsw+O+BXHGgqmNx3lDnyrD1aKW
         g27z+sGz0BssesDLEPoeTu/9p9D7r9ror5VCIqF4lpAviu9ph9qF2DLVoEDpX7DvcUWV
         RZeNY/Dgs8gPcGGtsZnwezaYMwENsNXtGDGFl95zue3mf+zCO4pgen2VJpEo2Gzm08aL
         MRs3ck0QzM2sxjk32UEkWH+JHo1DdGdACnL2hmskEZ9ET/UVZihTdbQkkieGy2N9KJi/
         S/kQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795453765; x=1796058565; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5t5JP4GO9Laq1Lv8Hq7DQj1ZPWjPnYaLMekX3WEbiFg=;
        b=qlOPitY2Buuta2NKhfIC8ihTl5lKc/rmhPKb+O41MmVX1/G9X5LG0SwJ0wHRTm/ECo
         bnXFRpCgzSn5WpxzEKapeCXNqCTyJcZ6Z7gg6yHJnRYLGk42l5ojm56PBBhR8Kmi2MF1
         cxy1oj4FkbzW2dTONKs9ymlri8fFlP2evX9jIeqdAnQHl1a7+FRPyVLTfyXWaB1MAftd
         n1xAxUcPqNpPpKxhn6sfFMhgZAIIUT+zYic9WAa3S/cDP9S3wCWvc7cOMZpgqzfM2JQh
         YpZgCqCzQZbCCaPnUhG60VTzB6V2N4TKxJv5rgHTzc1heE5JusBz7bDg0Oq/2hSZVM40
         BqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453765; x=1796058565;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5t5JP4GO9Laq1Lv8Hq7DQj1ZPWjPnYaLMekX3WEbiFg=;
        b=myeFulFBiRiOiFzILj112cb+QPwSUC7MN2OBvFmeypfkkVz3C6LE2/pRqr6KZk93zI
         tyQg88te3yaR8ekPUS0duMVEaChcHE8VUi7jiLncBxjPQujULkukf89z4TdgCCYg7pJD
         Uf0sBgH4sErSxvTUfaB05KShsSXcVMsr8rWSGWtyAGKDxiY+ahZUUZHeKHdyWn9SvoGD
         JHStGdJZihYkml0SYxGQM7IrR5QZKAq95agdwiKQLtSDzqF3c76+P4jyyEzUHXZFBn9I
         DrX4uB5LLUvaJHxDHkBsmD35k4TezSciwyHgXDT4vKyPXCuk7aEhEXe70RpULAyIWmDm
         NHaA==
X-Forwarded-Encrypted: i=1; AL+hErF69yced3pT8YJ4iPtW3txUO2QKLLHXEZzL6LbcBdXsDCu3dhoSi+KWZ8NqXKQiWlIMq8tmE6N2mEEAiUs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SUvUt00UAzsEEdXd8shgtY12Krb8hb2VNzLva2Ux6dBOkuKSw
	9oWfovp+6xqFIBpQRl31KW+YXG+pt7BLHTAtryMjTUtggjtHEiJaW3QNtxVa6Rd6ITey6J1knyI
	6j9XOYC/q3rrenOTSZMGWSpKEhDVY0u4=
X-Gm-Gg: AZFdTZcik1p9HozP2x93FGvXc5+3/tCupNA7HnJTWDThbrkzyO9Vc/YWtF7Rt/wyN2y
	HUgfiY3rK5V24oBftENjIXRYniKHFLfxtGfhAErZqGoTOVlHEYG/537KeD6twAo3dMkybKavmBi
	KYeAmiz9lbgONb80cHqriSo2DifouU/6/CHrG/2A9XtPRR2IrYClF8ep/Yr6Af+LKssVfEaiNeF
	6GrxHZkE8ptQECzEJzemrkOHG1K2RoH6x/e6QSVYxWLIbx4amTjb2+eXgwAHnQhjsR5xKVkVHTt
	teTGID0fQumCFuExx4StHt3rtKGSNOsCj4YnIpD2cP7hUKwMAVeDn762n1BHwrlr7OZj71uEHMf
	Kh894LbuGC/eIo1PWVE0z2u0OekR9nbYXWp6kPZyLgFOlHwd/OwsOseeVjZkzjp1MV83pIDQ5A2
	m/CZ5BJltlrKH4qARRoA3VBjSB9vTRZ7k=
X-Received: by 2002:a05:6870:4cc6:b0:4ad:8800:b277 with SMTP id
 586e51a60fabf-4bc82c96091mr11693060fac.24.1795453765399; Mon, 23 Nov 2026
 09:09:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120113116.153232-1-hjf3108@gmail.com> <20261120113116.153232-2-hjf3108@gmail.com>
 <1f9ad0fcc61446fb8ce49ef98d5292e8@realtek.com>
In-Reply-To: <1f9ad0fcc61446fb8ce49ef98d5292e8@realtek.com>
From: Jie Feng <hjf3108@gmail.com>
Date: Tue, 24 Nov 2026 01:08:48 +0800
X-Gm-Features: Aa3M54oVM5aty3xWPhSZL5u0WDH31EPxrmoQScFCe11fczaCvx4o9mUEUFn49LQ
Message-ID: <CABOQOSV-vbUazUTwb_Lt11Wv3-47P91OswOsH6r2=ngxOUcAKA@mail.gmail.com>
Subject: Re: [PATCH rtw-next v3 1/5] wifi: rtlwifi: rc: start no BA session
 for QoS null frames
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	Bitterblue Smith <rtl8821cerfe2@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 22 Nov 2026 at 11:28, Ping-Ke Shih <pkshih@realtek.com> wrote:
>
>
> Ho Jie Feng <hjf3108@gmail.com> wrote:
> > rtl_tx_status() starts a TX BA session for any QoS null data frames,
> > so these polls start a session even though they do not carry data.
> > That costs an ADDBA exchange.
>
> Will ieee80211_is_data_qos() be more suitable?

ieee80211_is_data_qos() only tests the QoS bit (0x80), which is also set
for QoS null (0xC0), so the BA session would still be started.

> >
> > Check ieee80211_is_data_present() instead, so only frames that carry
> > data start a BA session.
>
>
