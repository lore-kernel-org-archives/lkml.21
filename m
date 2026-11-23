Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423644;
	b=xKFbk9tTG2PGiDxBPiykSCx+/i5LlSBK2G1fXhanF+k133MArIM+MwE8N/WCyW8LdKvg
	 sZQc7mNCauk6hEP1wU/St2ZmR/Qz85N6GGWgSuJmCeMf2EDth7sI9XRhnp67XVaaHG8rm
	 Fk8dN4scmcRzNARG/RW9ewOt97EgIrw0w/AS0iq6PaQOWk+ujIKwQh2wX+qZJkNoEwI0i
	 b29xiNux114hrwgSsLn1JsuRpTXV6Y6Bvxilm/8xkwb/+5wSditOH7jhp1kV1VXMz2f4o
	 U6goHoDiYUG29SqUJtpcVChffbmHQORh66bx0hsePgtH3tfC6qx1JZDWgM/6rw0e4YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=a9avre7WPVBTm+1ssGfTak2MnTio6f4/ruqgmNL/TRE=;
	b=SnS/YCgZTd0HtXXBNdJww29kFnnfYcTQTs/1oWmAPbuxQN/elIrvjHNq6H9Vhz9UYRS1
	 ZDvYEV3di/P4msxCbuGuJFakYGHrIlVUtfW/pw5qBQ+lOFET1c3iZXDqNcKBQ9LQdtwU+
	 qtkHnVjXaTghekT9BwTx2WnFuwyhHFj7wPVT3B9ETfr3QJx3cykm1N9RbkwyPZR0zqzOe
	 6kv2Icm7N8rsko2xRBeWI00nR1A9UTXcSDAk6QJu2trwH5z4iv2dEQBiK3Lw0sciOou4s
	 F5KyuEKUBS1qPLt8uX0E6IlFPpyp3+uyVHIheq18FyNimlLfxRSpVrQccg3IPezweBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QEWpBz0U;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C383606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C383606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QEWpBz0U
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so1243453a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795423643; x=1796028443; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a9avre7WPVBTm+1ssGfTak2MnTio6f4/ruqgmNL/TRE=;
        b=QEWpBz0UF+1mc1fKVDkphV8Vq4Od5PrcQOIScdeTZwTHzNVAeyUZ7atmbcZwDRSx5C
         N9BE3MswpXI2ysrY0V0pC+iuFUgXVGkjHCcJZDhk/J3TfM5WJPkPVU1sdHjuMkm93WoD
         4wnmZiMs/Tj0led+OWYVnQfjkFsVsDw0SSpyr9gK7Kxr1fgpqa4VD7KGk1iblYk27dfV
         bx69GBVCacNwq6JbAY8ZKc1kQytU15PmLYTEWqSF8MJrqyy8pJwad8dcqj22RWS76bTg
         W7ddBTGFIvgJcat39+CKHAyp+puat+bN1IEcW5U9ibMNVNbanKAKvpOLobUxkD9/N9YE
         uAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795423643; x=1796028443;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a9avre7WPVBTm+1ssGfTak2MnTio6f4/ruqgmNL/TRE=;
        b=tkrvteS7UJoFTfwjp7j0cI+f2iqosOIo7miy19NTe6yGIN8DUB+qA2ZwVhvMKy37A3
         WxRNsF/htcvElRkLkMPgryN4MHW9uSGxlsfMcQ75e79GlJowRooH9uDSx5yqEc9HsTkv
         LPhBMChWjGHzTMPrhQIcTRadW9vogLf9hWKAmbInfA1BVmPev+Z8BJtM9wqYMig3/c9K
         y7BJKeOjG9uhXlYGcyrCMQ3Fr9K/3A9JXNclq5A4uUHdOyQSuo5SVDovprBoWRbF7fs7
         EoqiwVVC+IuvweleVAWmpFmgrvCJZvW5GDFieibMbrMMhmqbcTvFcxlDq2ix3UWP6gBs
         YbnQ==
X-Forwarded-Encrypted: i=1; AL+hErHxa0xoj7rRZr6OfYVGYlN2qGVeJROOFqFTfd3DsWelMD+Sz6IFitQ+nzA356BV3+S9885q6YEU5j9jVsU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nxr7UTCwLFepPndCnS1oTD4KWvVn0nG50EvdVC/gDf8M3QFR0
	nPoM3K+is37M7tCge1JvbOCjhzMzFRzEDEDRe+odK6mYekc4eU3J1qPj
X-Gm-Gg: AZFdTZfX0zSvqR9AAaWBN23vFgM13bK+pcsypi16RTQRhpXirPnMmCL6U/DgljrgUsL
	aKeUiD0H8YJ0ACp6KSIpFuMMVdcbB2beKt/k5ZTuy5BjE+j6ikT6EJMPpE8MKmz6WnYUP/phRj5
	XTLJx47PdPW8Buj5R1S69B0iUBT8tJAJEJTWTZ6JOreS57whIuEUPhJ8ZFAVtpaqLZ8Gea/vjWw
	UnnKRhv6QYjlYW8zJvB/NkNGQI7GXOlT/eJGHNOPCIARyFnhqGlGacy8L3AqTRVj7n/fv0cB4eg
	wsaOqrcs3yaPwoKQslryRGG8D1MJlDVyXTux/Afu5jo5LhYE5RZIWFryBKlgr1sGNOqwpfZhigk
	RkrjOAh3SpgrdiBqll9q4DzQKxrSNainxkkgELYxU8gHv9U4O2p0kSW70Qd4nCILurZhIF17H2o
	1rg3fWiQYr0OAFij8Q7XMbOFeq3yJmGDlkqemUVGMt8WQWolo1os2Kt6sqzh7q8CnO7gOxcVoPA
	EBDZFugFQmiOSgpHnF4qFWZ4RioTjUk5KqEgoW0Dpi2RGvNRVmr3ArKjJzCWSK1IbneoLVag5QF
	887NdR1yHPrHMSFyed38eIA2Nd+wXV+zo9RQVpHpFnrjff0N
X-Received: by 2002:a17:90b:1cc4:b0:3ac:ffb8:1809 with SMTP id 98e67ed59e1d1-3b41caea9e3mr8391385a91.39.1795423643465;
        Mon, 23 Nov 2026 00:47:23 -0800 (PST)
Received: from [169.254.42.106] ([113.200.174.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm18558082a91.3.2026.11.23.00.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:47:23 -0800 (PST)
From: Zheng Shuhao <viennaoffh@gmail.com>
To: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Cc: kapoorarnav43@gmail.com, jikos@kernel.org, bentiss@kernel.org,
 srinivas.pandruvada@linux.intel.com, jic23@kernel.org, lee@kernel.org,
 heiko@sntech.de, lixu.zhang@intel.com, linux-input@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+fb951970a334aaff00ba@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] HID: hid-sensor-hub: avoid lock inversion in
 sensor_hub_remove()
Date: Mon, 23 Nov 2026 16:47:15 +0800
Message-ID: <179542363584.4684.890797902249469950@gmail.com>
In-Reply-To:
 <CAJi8Lv-orD3VA1NJ71L1Qcw6=AWuBZesVFOHe5Y+bwzWxT8KRg@mail.gmail.com>
References: <20261120210317.184756-1-kapoorarnav43@gmail.com>
 <179526830578.567.7445109567862298713@viennaoffh.gmail.com>
 <CAJi8Lv-orD3VA1NJ71L1Qcw6=AWuBZesVFOHe5Y+bwzWxT8KRg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Ayaan,

OK, I think it would be better if you sent v3.

Thanks,
Zheng

> Hi Zheng,
>
> I'm fine with merging the fixes into a single version. I've just now
> read the other mail thread.
> If you can, please send the v3; else let me know and i'll do it.
>
> Thanks,
> Ayaan
>
>
>
> On Sat, Nov 21, 2026 at 7:08 PM Zheng Shuhao <viennaoffh@gmail.com> wrote:
> >
> > Hi Ayaan,
> >
> > Hmm, I overlooked the latest discussion, which caused some overlap
> > between our patches. Sorry for the confusion.
> >
> > We can merge the fixes into a single version or find another
> > compromise. Either way works for me.
> >
> > Thanks,
> > Zheng
