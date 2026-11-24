Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525956;
	b=oO71cO89WTFERMnB8aFg+uslJKcLc/W1MWe5hakYo8EU6bBEBTUtGu78a5heTpSUaQeo
	 OBi0qq9FWz7dHFXr3wL2AdjMP4jUzIN8dyUqFoq1Gh43uYpw7aEpLkvCTNXfcrNakUuvh
	 5f2jp4bU48ghJyNRHM5ws5y8V2rKZOziWFeYD1JOePTeAJvKBwLT9QGGq0ImsUETN0iW8
	 pT7tscySNnIH4TNXq+LVcBJzLiu8Y3cNUpXIYrgd3KU2QZ/GWAebH6ih11VRfwrFADDI0
	 UK43O4DCtI45rByEDYwQCD3v3O4DLXf2He1S9GSjVBPZ3KL4IP/KPv+KYUoLIrzgMpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=LS00jFvr9PC3GhAzX4jYHWKxPE6OoS0tT2nH27Ds460=;
	b=PxCN8hFTii9QQTkbUb+ddDw40Mx0xYaUnXzDiAcGEOQSR2GifATe2/GVK1btXACwS269
	 AzFNWe0B9B4SfQCJM6X6Ef1T4uFBbgLaN+277kcswWxFsXPTx1YrKLoKqqsJHhrpeb6DH
	 Vih3t3GN/AitFGlBTzYf5v5aHlLgTF5NPL9IFupQ2gyEodO0wWwyHwteiuqDQnCK7trCF
	 jLMUxa0g9T3zZBOG03nuq7OW60T9V9+e+cQCkphmMIpk7fIk57TsdgKgutyCeJ16bZvVj
	 5dsa4uFAm/pfQaQuSKps+9nLU2xsp+UQB9jRkz7XWvb/IMhZwf+Oaj6MqGX6Df+/Nnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q7wGGcpG;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B698B606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B698B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q7wGGcpG
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso889991eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795525955; x=1796130755; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LS00jFvr9PC3GhAzX4jYHWKxPE6OoS0tT2nH27Ds460=;
        b=q7wGGcpGaFYMUd6gYmYFB7rUz6kNZ4MqM/DlWk9SCSEOXmVbC7p5s9AgnF1iPi1heq
         0IW6OrpYo3G8Tb9hcx3bD7cpd6sJvKYMY4Esd/rdXdKkuyAvwBcHYeLgfTqJkcXdkQgS
         2/g6HH1bA58UHWz7Uj2Y/G59qvTDDUyw6msLKBaTYCHATfg6Prbzkq/KTij3V3U70Rz2
         oEFkH9LyUdRzuAV76oXBnOWB1gEVWX8oHgYJC+acQHyjj5ok/Rw/7WRJXlyF8Abu8Ixx
         UDuVRz4zz8PEmvaTZX/TCWzLkroF+TlksYvmoPzZ11x4RrSPMGd1LT1YYAKkY7LWuWGu
         pFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795525955; x=1796130755;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LS00jFvr9PC3GhAzX4jYHWKxPE6OoS0tT2nH27Ds460=;
        b=aPd3fMCBMtO3WwemPeVsHBeS9TSOHkqJyiOiC1jot1ZtPAFQO0kGAllOI1UT4mPQ71
         jfKEifjUsizhCj6ibRPRXNKyIZwt4+NxMJf+MmfffMQuBfmp09olbCzT1dMptoFbg3ir
         N3onK5KNLAd2AhsTNN3fetkViwwf7qcte3jv1Lmx0yLTVG6LzHvltjDdL1uyy9Ws7+u/
         e54QLd3OwCvIl6MUZbgK+z75QQwdcH247sKBGMdn/A2VPV+EwcKzpFzXdwOstaioMoPB
         C4BkA8ifUQqRHnwKCvFRl5130aHRSFEtVo1tdrrk5WdXpcu+hm0C6QLPU2hGlxu3GIHy
         parw==
X-Forwarded-Encrypted: i=1; AL+hErHREjTje9XaSm+wgulmidQpMiDMA00IaEQrHHwg49ABczwyHqazrgjIoRnQLf0EaZ1V4LExutos0CGoUMc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PiIETwj9rpljR4jCWUOu73eq3zEdHQJ5Ij53pFpoqAIYI1ZVP
	Z0JazBkLvTPtb4RVK/hn43+fp7Cb1Z9JHJ54Dc1JkVvzLDi7jHQ8A1mg
X-Gm-Gg: AZFdTZfke1EsPywqToRg4mYH1JAGDmkS5HvXa43H7njro4dkedbWvYWFp0oZyREGrzZ
	k52nsInXPpaElGvlTydKko2fld2rfHon4roXOlnSXPL0PbhDFp0mdET6EGHBLeolDYZwSu8sfDB
	rR7LVVN9EJHvcHzVHz6msX3AWQCMCB7zBV2ytL/BOdV4nJqNbI5lZVuXKOQTbZG0YBczNW4j71S
	hfusUfw/VbNgPJuXOeOFLoWbgFcicpGdi5XcfJydK9IYaVhdydHLUlsugYjEoalmytU8xieo0U9
	vrjwRd5ebM5ampUUhmYLxeRA4XslY7PvCf9a6VPSWohtUQ+sPlCvgjQpaKV6X9loxfwURXe2Ufr
	K9Jf6KkdVkhqeHWkVUqs6JtxZaQAslReCV8wkYE0JvvnxrG/ZFGP2G2Z1CxzpWhI9wjI4/UO186
	qNi6SUGYsac3ARcy60+8QRb8j0on2XdOe3rmM9SNX9JCY6Mo244BLRVck6VLAtpjf/RveSf5jDy
	o66WmWSB2B1tiSXHUAV0PsrTWEWugcDYZMi12JExCy5cakpPoPv+Ie/8StK4VaLu1m0le/+2O/+
	l2d4Q7obdPojq6naIpVigp3+X5rbwPiJfEz+2wZsk3FYC33dSVV9YNf0sp8=
X-Received: by 2002:a05:701b:42d4:20b0:1b5:43d8:b82a with SMTP id a92af1059eb24-1b55689e7b7mr14691957c88.9.1795525954542;
        Tue, 24 Nov 2026 05:12:34 -0800 (PST)
Received: from [192.168.29.85] ([2405:201:8026:213e:1412:77ad:61f2:79f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm35659682c88.10.2026.11.24.05.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:12:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] drm/amd/display: fix USR retraining support check
From: mdshahid03@gmail.com
To: mdshahid03@gmail.com
Cc: austin.zheng@amd.com, jun.lei@amd.com, harry.wentland@amd.com, 
 sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <179433297650.153576.17456786292064820559.b4-reply@b4>
References: <20261101104727.141852-1-mdshahid03@gmail.com>
 <179433297650.153576.17456786292064820559.b4-reply@b4>
Date: Tue, 24 Nov 2026 18:42:13 +0530
Message-Id: <179552593350.187453.11405172136554803760.b4-reply@b4>
X-Mailer: b4 0.16.0

Hi,

Could you please check this patch and give feedback.When time permits.

Thanks
Shahid.

On 2026-11-10 23:19 +0530, mdshahid03@gmail.com wrote:
> Hi ,
> 
> could you please review this patch and give your feedback ,when time
> permits.
> 
> Thanks
> Shahid.
> 
> On 2026-11-01 16:17 +0530, mdshahid03@gmail.com wrote:
> > From: Mohammad Shahid <mdshahid03@gmail.com>
> > 
> > The USR retraining support check tests the address of
> > USRRetrainingSupport[j] instead of its Boolean value.
> > 
> > Since the address of the array element is non-NULL,the
> > condition can always true, even when USR retraining is
> > required but not supported.
> > 
> > This issue is reported by script test_addr.cocci.
> > 
> > Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> > ---
> >  drivers/gpu/drm/amd/display/dc/dml2_0/display_mode_util.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/display_mode_util.c b/drivers/gpu/drm/amd/display/dc/dml2_0/display_mode_util.c
> > index a8519f547dce..74cb65687a50 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dml2_0/display_mode_util.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dml2_0/display_mode_util.c
> > @@ -412,7 +412,7 @@ void dml_print_mode_support(struct display_mode_lib_st *mode_lib, dml_uint_t j)
> >  	dml_print("DML: MODE SUPPORT:     Host VM or Immediate Flip Supported        : %s\n", ((mode_lib->ms.cache_display_cfg.plane.HostVMEnable == false && !mode_lib->scratch.dml_core_mode_support_locals.ImmediateFlipRequiredFinal) || mode_lib->ms.support.ImmediateFlipSupportedForState[j]) ? "Supported" : "NOT Supported");
> >  	dml_print("DML: MODE SUPPORT:     dram clock change support                  : %s\n", mode_lib->scratch.dml_core_mode_support_locals.dram_clock_change_support == true ? "Supported" : "NOT Supported");
> >  	dml_print("DML: MODE SUPPORT:     f_clock change support                     : %s\n", mode_lib->scratch.dml_core_mode_support_locals.f_clock_change_support == true ? "Supported" : "NOT Supported");
> > -	dml_print("DML: MODE SUPPORT:     USR Retraining Support                     : %s\n", (!mode_lib->ms.policy.USRRetrainingRequiredFinal || &mode_lib->ms.support.USRRetrainingSupport[j]) ? "Supported" : "NOT Supported");
> > +	dml_print("DML: MODE SUPPORT:     USR Retraining Support                     : %s\n", (!mode_lib->ms.policy.USRRetrainingRequiredFinal || mode_lib->ms.support.USRRetrainingSupport[j]) ? "Supported" : "NOT Supported");
> >  	dml_print("DML: MODE SUPPORT: ===============================================\n");
> >  }
> >  
> > -- 
> > 2.43.0
> > 
> > 
> > 
> 
> 
> 
> 


