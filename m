Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795256364;
	b=sBRcs4HTntTa0feJmoK1NU2cyTOBiH7v0aPhBGWBkwaozQYNR7QFUE1AA5HG8Csr4jdm
	 4M7UUrcINNbfTMqA9cGa0I5t8cxwRbeSHrrzSEBEa26unl99YkfzVoCJXkhVvT8GHy1Sd
	 9cE6HQkD8Qn714YI7FY55L6dlz+ZZzcU5WeeU+TFUqRGD88+EJEkN/sNr8cFIKOP8o5Pv
	 BoJ8fvkxqxiObSSaBiGNcnpDVfUZS7biw3PKYnglL8bfI0b0Mh3HcL/C9fvG3FDQx6TxD
	 WS2kCCGNb+6/6PHGzdcbKaDUsR1pUnUJUi0trOl3ZRjvNys3nmm3MY6eoQ3Mwcy4t4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795256364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=N9CIh5H4VwprN8NFJCHt7BtCzMbNAPuxvGffemDSkdo=;
	b=uzBrr50dIJ4FByDJgPMNxI20HF5ddQMuEaEpMdH0eF2pjbx262H0nc0EjXgTbX+GyKd2
	 jwMCVR8VTPWP+TJXUO5I/lH9tEcbxAc01jTMN1NCEBtcCGvHrhAA1VnntKKQiS2xEeKNU
	 Ukj05WPWnPsNXUjSfRPWHJSKQFlb096uXztih/OT1HPf74MpQ1bsz4Z6iQbopsgjjG5Zq
	 Wc3m665qH3Ny/JZW/JUEhJP7r33cSVih7vc1dUXQsbQuy6b8qF9nhXkJ+xDyWxmHY0aeI
	 R3JA2qi/k8+2iaR4/9SB4/hAgw7xnO+vsCLvID5s66Zdu3AEZyeSSyIKubXJ6BKNbHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=hoiEimoX;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FE8606A332
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0FE8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=hoiEimoX
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-94961ed97bcso200510685a.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 02:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1795256363; x=1795861163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N9CIh5H4VwprN8NFJCHt7BtCzMbNAPuxvGffemDSkdo=;
        b=hoiEimoX408yjyDFycIzfZlVs0ZY1gTa9U7w/ErM8fupedSMctB3kNZr+vbp4eeGhu
         VRqjWyuIZkRRdQGOeKgJU1KWPhRwjBFZydw6/VOXUeNmgTiqNWNV29OjFKEjVTgPoF0Z
         nXvZZYtCC9EqKLdLrwkB5+zpoyCbmRQ6Y8nV3PKurhfMgup6cX12tEDRTdZ64LFKU7rf
         evSNyKtt7qb9NVT/YyLQvo02uZ1IXMWHSJmpCl9pd3In7+oLwbjipmEn/T3wuhI8dXHQ
         yDTOH09PePQ9XLaAbQo+ks7dsmGyspYKwigVaH7CRBrxGYuzVraM6+bwYrQWBq4/gDqP
         rNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795256363; x=1795861163;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N9CIh5H4VwprN8NFJCHt7BtCzMbNAPuxvGffemDSkdo=;
        b=fMpvny54mp1//4eaZlR3ONhBNhCXJHSnhEsl/qUL4R94GNJ0G/PXkUrAy5MaspmSTT
         Ii0XcIT9BaBFhXghBsO6oG7+brrE+wKSQuJYXw4mhvQ1LueO+GSmYHSZ2y0IXPKk8CD+
         Qrr/M9Qn8rR7wTKo8NsT6+4e7h8bKhjpSzO5NcTtv06g61TM5FeUkzvRR2Nzz19BL0Q0
         8nKPWADX/dJjG6Mq8AyF1lmLD9j1Nt58M2op8R6SHgio7CI66rXRjE+9Y2kTI/QSnV1p
         T1NAw76CWhsNjGtLPxmiaQMBkoq4xQiJMf97BywKj7gzLn0phPVUEHTPZf4T9UNXAUGv
         PQHg==
X-Forwarded-Encrypted: i=1; AL+hErF/3rRLnth5PskNGq8sLgKPCUY/BK2FDSVk6giNWyIA1X7fBsXw9D7QJngF4dAIc2BdHAeCwka4bRRQELc=@vger.kernel.org
X-Gm-Message-State: APuU4Z88p1dlcUrmWD86Lqvjkz90s6BND+a/W94oa5UB3DUZQ0xqDp2l
	sFa19KtJk0hvymwjnYFE54OcfnO6wRdM5AJddCNY/57IWzEKVYferOEJjfUPIccL4g==
X-Gm-Gg: AZFdTZcAILpcYq3aQwpBHnkennmQ5ebundyYvdC5GfuHkN+URUXjFEoKQVeFpyvJQbf
	4CQ+CRqoyiW8tpV5Mu+3zdIyn4ym+MPIq6EiyTR9zhMlyExMd1cnrGj/fkLRBcN855swCIL003P
	nEv8S2d99Gx6WPbCuRqZil6w9nLjevhelfow8j94vrGSGs59JIxhAI7L9hFopva8di0zj9N2ddL
	AoPmJQEX8pXEIbbbD1NcikYttyDnLjKIvKwHKLE/AyWlr5CBcZriuNsCDL6s2mF/9RKoncLyZ6F
	0YSa55td5U5UkOsxuCq3STAmDiga4e8DiTK9Uxv9esngA6APICdohSrveF6nTfFwazIi5qN/M76
	oY6Z1qoRDnZBP4vqGi49Th6macD2+wv+5gy67wRwS0g7Qpi65ZTBgPY78VHFgokBNvrsuX4mqUj
	gMjA0z+Fym6mKvTCNiOb8Bf9zwZPeLcNnhVt9YunKM1svITgqGzmCRELZjetdE8grpyC4McAJui
	GXyPvxkMSTIqx6Bmf9OaxwBm8S1WFga4K+4BYroviCudOiKe2uRN69h5fk1Kdgop4Gh9vfh/ZSf
	VCY1AZCSPd55uZ7S1BcVpIJbUNtFOg73Efkam285+t9Eh3T7yRk=
X-Received: by 2002:a05:620a:601b:b0:949:76ed:591f with SMTP id af79cd13be357-949ba82851fmr949300985a.8.1795256362690;
        Sat, 21 Nov 2026 02:19:22 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb35005dsm393964485a.11.2026.11.21.02.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 02:19:22 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: slava@dubeyko.com
Cc: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] hfs: avoid reusing occupied CNIDs after deletion
Date: Sat, 21 Nov 2026 05:19:17 -0500
Message-ID: <20261121101918.3395879-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <f59ea6b2a8c60594361ab596d92bdf98a217dd83.camel@dubeyko.com>
References: <20261112110128.4082071-1-hengyul@cs.unc.edu> <2bbc10eb1dd5ee69329a9307f14fd15b1815b898.camel@dubeyko.com> <20261113194103.3825961-1-hengyul@cs.unc.edu> <f59ea6b2a8c60594361ab596d92bdf98a217dd83.camel@dubeyko.com>
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

Hi Slava,

Sorry for the late reply. I have an important deadline in early
December, so I may be slow to reply until then.

On Mon, 2026-11-16 at 15:21 -0800, Viacheslav Dubeyko wrote:
> You explained a simple case. :) My worry was about the case when we
> could delete some number of items between [16, 20]. For example, we
> delete 17, 18, and 19 at first. And now we delete item with #20. So,
> leaf A should have 16 as a maximum CNID. And we can use 17 as a
> next_id. Correct?

Correct. I ran this case with the patch on a fresh volume. Creating
a, c, e, b, d gives CNIDs 16 to 20 in three leaves:

  leaf 1: root folder (2), thread of 2, a (16), b (19)   max 19
  leaf 2: c (17), d (20), e (18)                         max 20
  leaf 4: threads of 16 to 20                            no file or folder

  rm c (17), rm e (18): not the newest CNID, next_id stays 21;
                        leaf maximums 19 and 20 stay
  rm b (19):            leaf 1's maximum has to be recomputed, the
                        root keeps 20 (from leaf 2)
  rm d (20):            leaf 2 is now empty and goes away, the root's
                        maximum has to be recomputed: leaf 1 -> 16,
                        root -> 16, next_id = 17

The next new file gets CNID 17. I checked it three ways: with the
values cached before the deletes, with nothing cached yet, and with a
remount between the creates and the deletes. A debug build that
compares every cached value with the records after each insert and
remove found no mismatch.

A larger case: 2000 files created in shuffled name order, so the
CNIDs are spread over the leaves. Deleting CNIDs 1916..2014 first and
then 2015 gives next_id 1916, and the next file gets 1916. Without the
patch the same steps end with "File exists". fsck.hfs reports all
images as OK.

Thanks,
Hengyu
