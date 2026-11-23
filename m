Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446607;
	b=Re1nvFyBWkVXyDndeQRTXDiqp1GzDkDFl8CvL8Ut7Sg8ujtEVREZHtngnQcreiPfTJXQ
	 ybmRBhIoTBY3xQKfSqMF/11Pvsj4NIv/gwS5MTXpyJhGAP+3g87wnjQyl7gx1I6CVxrI5
	 OL8MW+xvXLczNFZICgJ6vtlo4mZlfkRUhm35xrwPog+ndFeg0Xj06IXaWPV3nuK4OwxL9
	 i0Oa2ouHQkRWKk3bcFmLNmLS2hxOYRls9ppfur7XuvxLLCNpspwrF6a4PX9OrMWMpCKK4
	 K5a6FYeiu2UdBJ2KpqsuMBQ2g9UigqJnt3H/0SIYXD+foTDj0bA9uCTpUGZK2o/rJNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dz52cAd06DhrS+w2eA1gjA1iPlJT/ApD0Ocp67pISs8=;
	b=qRV63wtfrIA/ByRlu1KC5fMtRdUgvbCKfWnc40NLzYQWyT15WbNjp6b7s2MQ3KnO/i98
	 4Ea3Gw/AcJf8qzTir0wMIvCyvk426roULPqTnnTnj8teoZS4+GLlcn839UFoKHw4GH7Vz
	 rZ+CDWy4+wOLUVLEqFNmQ10I3+WhC7VG0PajR1bCHrEXg4S2zB24b72qjkdpUZicgE4T6
	 6xpL5HJaSEbMt5yJmNeuFYOUJhCSykfwbD8zgp77+nfli0WdXWDPzITiS1QVcD2Ie9/Ff
	 ACTyk5NoGlAuM5K+uAkLtnGPfxaO2tZqCLkaHrnxTzkZJ7xB1cXU6GYMcC/7RWZL8sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KlLoUKzr;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F70A606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F70A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KlLoUKzr
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8c5ebbc5150so2421384b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446606; x=1796051406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dz52cAd06DhrS+w2eA1gjA1iPlJT/ApD0Ocp67pISs8=;
        b=KlLoUKzrAGBBjUKAIUzd57PO8Cutrhk/YnNNmvLeoU8J31Qs8DD54B8ZjCOkDLESRr
         6emwUFKoeBsortM28AeKr0oQoZPg1di8fYgh/gAVQrMYMilfo+Dw+N4/5P9SCkzixzvA
         vdIQ62ZfNnXfgGfYzkmxCR/gKLkHtcX4v6cMggVulMnBKIwxnkAiazOZlqft8gahmHhD
         a5twDQyC/AxYuV2jp4FUXCxpHwxQ3ffDeBVS0lD1+wD8ECPwVGWDv/1XT8TyeuwShEUT
         n1jSSigjcGSjbDB6fFqpvWuNMP3ZANkq4U6efkTHBFvP10Mg5E/3S67np9oTHQqoFnLy
         bhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446606; x=1796051406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dz52cAd06DhrS+w2eA1gjA1iPlJT/ApD0Ocp67pISs8=;
        b=wq5xR2A4dycucBC4upoVU2fJ7QSbKsO0J8HduZFhpRFokQ3GEp12p8gn6t5F7Ail9V
         4W4VGUbar0GzieP7IQk+oNsmgbXOyCGoUl9f9rtM+c6+KQchIh6jZybo+xUjOAa8LW1c
         6mPaIa8NQTUKRbGr2FBP+ROJPk1DkMNf9k5vRDJefdWVirP20qZqSj0PQLd90jRtpagA
         UX3rqO7tSAnuNM8qaFG6hP/6s3S/3mExnwBPnoAIHc7AFPJBgbkckh5kihcvlVCHSNA/
         aIeC4sYbbJWMrUepLVrerL2In8ChPzagGu3Ea+2oEljJgdji5mmEnnsq/jRzFCHBRiIP
         bM+Q==
X-Forwarded-Encrypted: i=1; AL+hErEQ5M7uy6OgCRlCzRng3P0kaFsp6CtmvMKyYvEU4OkRM1GRQBaPIo6Yado5E0FIsMW1uX+8jc++ijgW0Fk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8apA8ZNCs9FI0FcMAuVtoYYTzISc2ujBVB0KFndF99I+0d3Mab
	CcWuxuK9wzgb/ZDYps8OWSgZxsoPtkDmxix1VtKxliswm5Ddd5oOouH8
X-Gm-Gg: AZFdTZdP6unVySvH9esLGm+/FN3l6nB+/6xR+gWg23xBNRVQXlZ4lsuO4DVN76U7B2m
	GToRknRcQH0KgBLFArXSLWha9P1MIsJ/FcLktsTXgFRbFp96uUn6UYFYIKKeprPhzBbuUj1lgCh
	po+gCbRsbSgvvt01eyTLzBnBc+eTdu38PYbmGrKF9A8Zq3fWtEzAcoDTFJExsHmyop8MaP5qB4x
	KQ+1vJ//Jdia1IgGHbxqt82VSbH6bOLUV9lamt+cfYKIsk6gSSExFqwqiqpZ6tJsI7mntdB5Yex
	u+K5g0sFhYTJEsbRd523s03PcW8AJQr/Uvuc86eqXnXcuUA9Wf0sLWmCQbDZQ7R2x4O/IHWOVBp
	7LaMkNu/g2k/CTLeYz8c1/FGT2/xw25wN2pKY+AqbSTVhZt7ya9YnptJOAFzeVMNVCVLqx/O28s
	YYozUGrTceZnWIXl7BeIJN/CIf8Adv7TqwuyDlxt0YUDbxWBLMd4RaXv+7Rmzf0pe2q4PPNhez8
	0t70gmm4ZGbpzb0eM54HL5gTcF81U6ZtADn1nZmocP3ZdZnQehYFbv6BCIYkwx3PlivUWDs/yvi
	8ZMBzSHPa4ZAPhX9mMOb2ZvgoHieSZ1lgA1nWRvzmzmOLKYy5iSWkOfy/MPzzjHhGUGvrHrSI38
	qUwn6ndBvCY1oe0+a
X-Received: by 2002:a05:6a00:928a:b0:89e:6bef:70f9 with SMTP id d2e1a72fcca58-8c87bfa8116mr10077691b3a.27.1795446606284;
        Mon, 23 Nov 2026 07:10:06 -0800 (PST)
Received: from localhost (218-35-178-218.cm.dynamic.apol.com.tw. [218.35.178.218])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c86d821637sm5956464b3a.0.2026.11.23.07.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:10:05 -0800 (PST)
From: Kurt Lin <lylin1023@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Song Hu <husong@kylinos.cn>,
	Mina Almasry <almasrymina@google.com>,
	David Hildenbrand <david@kernel.org>,
	muchun.song@linux.dev,
	osalvador@suse.de,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] selftests/mm: restore hidden hugetlb reservation scenarios
Date: Mon, 23 Nov 2026 23:09:58 +0800
Message-ID: <20261123150958.2212229-1-lylin1023@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <apqBn7tWDHQeMrzB@kernel.org>
References: <apqBn7tWDHQeMrzB@kernel.org>
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

On Fri, Sep 04, 2026 at 11:30:23AM +0300, Mike Rapoport wrote:
> And this code breaks our CI e.g:
>
> https://github.com/linux-mm/linux-mm/actions/runs/33040981840/job/98414290236

The hugetlb category in that run hit its 300 s timeout inside
charge_reserved_hugetlb.sh.

With the stray 'continue' gone, the "more than reservation" and "more
than cgroup limit" cases run. They expect the write to fail, but
write_hugetlbfs_and_get_usage() still waits for the full reservation,
so most of these cases spend 60 s in wait_for_file_value() before
moving on. The CI log shows this: hugetlb.2MB.rsvd.current stays at 0
for 60 polls in three cases, and the run is killed during the fourth.

Skipping the wait when a failure is expected, on top of this patch:

--- a/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
+++ b/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
@@ -252,7 +252,7 @@ function write_hugetlbfs_and_get_usage() {
       "$cgroup" "$path" "$method" "$private" "$reserve"
     local write_result=$?
 
-    if [[ "$reserve" != "-n" ]]; then
+    if [[ "$reserve" != "-n" ]] && [[ "$expect_failure" != 1 ]]; then
       wait_for_hugetlb_memory_to_get_reserved "$cgroup" "$size"
     fi
   fi

takes the script from over 600 s to 64 s in a virtme-ng guest, with
all 56 cases passing (only 28 ran before), and run_vmtests.sh -t
hugetlb to 83 s.

Song, would you like to fold this into a v2, or should I send it as a
separate patch?

I found and tested this with the help of an AI coding assistant.
