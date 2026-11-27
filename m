Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792845;
	b=NGUCQUBbg0QxwezH9Lloct8wlmEfshWb3j48KfFQK9zCAzG1yykuQQFqiWpLwlpWS3kf
	 087ND8SX9Ct4vLjKzjxIR2kspgpj51+4ApwkefVVBD6z+2DZyDsnBgkI/AzC92bREHrG4
	 v/rsn/QtUpQe3nze7wxbEB46wX6d4Uv87RdA/58gTcXMQJoFsG4yipDZ5wUgKbRttLDS0
	 +9Sjoc7eZrFpPkKr5xuFQA45RcJMwAz54wCwggzoUIS353zmbXeODzJtxCAzgnc6UVMQ+
	 vUb0F9N5pZBrFQdnjFQgLsI0UTI+wc/42YjFYb7RFDw9MCjZLeEUhOv6nKd8oNL6QzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792845;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=G4/GlGn1WSKNq78/bfPKOJ1ydFGAlPHoJ0mvOnfpMMs=;
	b=Xksj9xR9lxQ7yXjeSXmyaCYNAwdVfKN/dEzbM9Ue6QTJd9K7kaw4Kc+YOhhl/STGyS8D
	 SrjuhtmVVuhbgwCNtWsxvvYbELHzINmnA/c2gwHzJZhGC8aycSfihSUVFPN0S2FKwMWgP
	 LuvUlLHGQugHC0mE50of9KefPwj65rMsotSbCUfuEUvIx8IfimTsw+5v4to9HZEuJ4W4b
	 gfmuKhD2KKCCPGFADBFIvX1YKkd4sktIezgMWuPqBAV7wf132khG6GWSFmntlY02MNeR2
	 fm++olBqWfx5KIBWWQ7tH+Hhk9b77oDFh33iEmD8q1q+Bo5zeHDhRYhx8NlesV2phXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=PLL+l15Z;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15CE606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D15CE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=PLL+l15Z
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59591169E;
	Fri, 27 Nov 2026 07:20:41 -0800 (PST)
Received: from [10.57.71.121] (unknown [10.57.71.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A8F93F632;
	Fri, 27 Nov 2026 07:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795792844; bh=9X6qNP8rGJ7XVuJJDK+m554NPJ+xdXd4p41sM8qWzGY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PLL+l15ZtmSx6ri5+DBurqMe/gMrlmxLuY8P3+iAaAvKG9uMgxsPr4snm3zz2CpkX
	 RCPuUwYXnWueE3pttnkeu1/4rKfCpUlrn/GsUb4joCC+7vQtuAE+u9m2j51gGFmfeY
	 oP2GetUE0Mh/kP3pXyXhcK5wrr+fXgQeeAi3tcRs=
Message-ID: <a4c8b947-0b3f-41ca-82c4-aef3704b4451@arm.com>
Date: Fri, 27 Nov 2026 15:20:41 +0000
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
Subject: Re: [PATCH v2 13/23] coresight: trbe: Simplify wrap status handling
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-13-3f57cf3199b1@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-13-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 17:55, Leo Yan wrote:
> After explicitly decoding the TRBSR_EL1 EC/BSC values, unsupported or
> unexpected stop reasons are handled before the WRAP check. And the
> erratum and pointer checks is no longer relevant when deciding the
> buffer wrap.
> 
> Remove the redundant checks and treat any remaining TRBSR_EL1.WRAP
> status as a wrap event. This also means WRAP with BSC_NOT_STOPPED is
> reported as an overflow instead of a spurious event, which prepares for
> for TRBE wrap mode where collection continues and a maintenance
> interrupt is raised on current write pointer wrap.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


