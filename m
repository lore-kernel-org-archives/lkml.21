Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452751;
	b=kGBYq+lbXgvF4CI1MTsnFmwR3Lz8uoHUGQAj9NHsf49W4U2bqMaQgegrGH2KtrB+4o2f
	 Zm6ATj1KllLXkEuigAtXIvBXBF3EM68UnTUqwDaTAo2NXv59QS3Uspv/R0xryNErpkNzg
	 2JMlpHPo2xyBHE5C84tcGFxRmf4O5Q1rqkRLAlb3fqjcLZH98ofcbhyVze+Tm+UuK/UMo
	 1xpbm5qMCAQ1gi/s//7SG4pQPDiO4iR4G4Ge40sXcXBygoBCnkUOtkFJ44oX7wMTNtE7J
	 h+BqqAM/aWp4CLihCpHb39KibTvtL2ckitzc4bmb1wtZ/UNAFWkEMgCyypThZgJqBxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qCCO3SHR08M4R905gwt4IjFBKdk6exd3kEeKNWeigAk=;
	b=vz/xbICsc1S9vYtxLGmaFj6IW1uSFzKcUW9/WLBpum8ICGsSQuyHyi13jjl6ViWBaGcm
	 4JWzuMPxsTwXoQAI3BD5kqbMmE2MGN4MupZpzelEZ4wwpr+h7xcWvnKKQDTlTliAbe28Z
	 krlX0dK9HGSgWS3zQD9Azp3PFb3ueMBAjSbkAWFUHAmF+CwdrQ/EAF5ygSa29Rm4OWO2v
	 dfwY4cPaqG3vzmRMVJtg2gB2Fjdpm8/j6CzEETyVVe0WCxCv53J+G6uKk4uhucHvHEwrW
	 yYPFwHetNfbeqf6hiIcR0eEfHTQYSB56JQbFQL2GOZCplyuHK7+y3LfLud2V5kmqncw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JVek8zEL;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A354B606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A354B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JVek8zEL
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490f38e9688so2477564f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795452749; x=1796057549; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qCCO3SHR08M4R905gwt4IjFBKdk6exd3kEeKNWeigAk=;
        b=JVek8zEL09QPtoo7101zT7728A1X6ot7dGDNcM/BFYFf9K3XpzUA7cuv3KZDJ50NC5
         dKBBCoCaLTekPOrqLN4tSHZqwfjVtq+Ih4mMBTPdt9JzlFtCO0jEEXwBi0cbYQvfBfYY
         nfbdiWALYaLJN6LrKJ4b821N6WRwWyaBavivC9gsak9C7hHsntT41Ft7z4v0vUOK4o4D
         e6eNfaund23X9bKHBaWL24jOU0qbGxeCwxpDs943RgCkVF1kNxDCuKnhiIi119wmMZ0n
         LxenXZw2N00qrN0SELjxLsXRZDyrbEqADi3YBqEwUWKhYioOteYZZqHHQM+26xULDdvj
         rfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452749; x=1796057549;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qCCO3SHR08M4R905gwt4IjFBKdk6exd3kEeKNWeigAk=;
        b=Cj8cKFjZbIPFve3maeLZlrzEfLLXydtra5ZuKChypqQFCMtHRmoNjRh1TrG/afDnI+
         TM4R4SVOUD70J3rvwEp7CpVZ8JIJmW/1XCD/z0F3ubv8xc2xdZp721d2zOsm4wYPPC3A
         J5ToycnyTcLngsX00TwlT4vADcFEmlpCvLDARR8Ze5EkUWvGZ4Y6rQXNbj4GIHMA91Ju
         Cb8WSNXuCQlXV+Hj4vl1o0WLDiSFSGNUc2t/NY/lDeOtj2QNgGpN4phHJUuzsXKS3+1e
         OZclGj6TRFsDiGb3sLyZdHooxAdRkmqQRiIlNBZfy2EL6fm9bjAZrBRd7LzjtBXkx8NJ
         vRow==
X-Forwarded-Encrypted: i=1; AL+hErEYVsZ9joqdfYtbXI7QP2YIxRgqo/U4nuOAaClJRWUrP628iKEvZhCVBDvYqkYEL0GWKfGZdgbye/qVPWU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oc5nvijqf182F5ym9P8k7NZujATKKLewolzTmiBk8AfYjs9q5
	t72ui8yXCDi45mYjlMx4nHBoHTPSWPOEiFDzv/BqwzHGKeLZIIosMq4I775MCLGDBuM=
X-Gm-Gg: AZFdTZfra4ha7sJRYELrE4F/E10M5iZ6xVIKzFhXfAXD2XGrOrAhkfBzInLudXnRqAK
	ZzgASBrLiRk+wDWVEexF0rC0WIWZDDtPdZntP7Tv83xdOc32QokjEcgkRrHAs7OqFSTaO1HqSQD
	bdVA25yErhbKgv0kBOyCPt/2DBVsaQnUziP1e/QC+kQ9ASMUJ/IlP3vvGLzux7nsqmkC3fJ3nYY
	yh9pWszxDxtSEnyu8/5jHLG/MMXNiQHF4aQ+6f36bnHbhB3MKWIkRq7mvGbMAH1i9AUtzt7qON5
	mNX2U769TmMydevoNZKY3lK694/5N50IemEMt9hrLvXaeUy5yk+bGt/Vg/xgb1+HJbbRDDHU6Lu
	DL92rEHnHeyKxQBDaADFDZnZhyoI0yWnPjycRU5LBYA9VxkxS+/QEOU2RnOFlXzzb1Yov59eGZ0
	SAR6f9yXG0z9Gr1YghT+pg3QkK22KcQoDwJDUOD3qWNGbWfUSDAnJrDiZyZQVP/DxEH4D2SfNAb
	AF+ylLVh2g8L4hFXv6iGgO5ZuMDq4ZiY9EmoD5ZAx92tt5tDTix6DmbnVy54RtAmK9mUonGuJsu
	eHOfJeXY+MwVwHr+lFWspemxGO1K0+bVV+SdJTh0KEJFTZghMwUWyKpyXlI=
X-Received: by 2002:a05:6000:230e:b0:491:eb12:e151 with SMTP id ffacd0b85a97d-4aa4e01e2dbmr34950680f8f.4.1795452748754;
        Mon, 23 Nov 2026 08:52:28 -0800 (PST)
Received: from [192.168.18.21] ([46.197.185.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm21271722f8f.23.2026.11.23.08.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:52:28 -0800 (PST)
Message-ID: <76f47b38-9c12-4f39-b169-7f75575b61a1@gmail.com>
Date: Mon, 23 Nov 2026 19:52:26 +0300
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/fpu: hold fpregs_lock() across fpstate_reset() in
 fpu_flush_thread()
To: Dave Hansen <dave.hansen@intel.com>, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, chang.seok.bae@intel.com,
 linux-kernel@vger.kernel.org
References: <20261123131836.220685-1-omermetekaya0@gmail.com>
 <57ca9082-af96-43ad-9f7e-f3969ea4a5ae@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>
In-Reply-To: <57ca9082-af96-43ad-9f7e-f3969ea4a5ae@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/23/26 18:59, Dave Hansen wrote:

> Hi Omer,
> 
> I'm genuinely curious how you came across this issue and decided to send
> a patch for it.
> 
> Did you happen to read the other (brief) conversation on it?
> 
> https://lore.kernel.org/lkml/6aff5b8e.4ea6388a.d0c9.0001.GAE@google.com/

Hi Dave,

I saw that on
https://syzkaller.appspot.com/bug?extid=58cbd7974a103b8b8916 and in the
"discussions" section there, the discussion you had with Chang wasn't
visible, so I hadn't read it. Looks like you were already working on it.

Thanks,
Ömer
