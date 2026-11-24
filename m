Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795561102;
	b=IaqRhOmZzjFaNdDtneKQIeiWIId9Q6ScJeYgBmFK8Ei6xBoqrJmbPbnNUx9kLE13MlHn
	 YcWv1u4Z833Z5cVjWZCtBknjHM0YllsdjAjTZV84ZKVSyapJTyfqNIvmjX+weq0qZp0d3
	 OR8mKn3Yq8QfsHCVTVzhq6ZeYMSI/pYLAeM4oRH7ldTaiVUzdH8x8VjnCcqShCgS2wj5x
	 AzRXQfiwVGLhWFxxPA2wTdTx9/R6cAcnyF3xdMmLXyPIIpF66/TRDKq6Vd+iseJd96kcK
	 +VC2vfExmv4s2H8RPZIsFkpP/oVyhXeefb21N0Zu0vJQrD2m4lVdCphXgXwNmgHKTxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795561102;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=oYWZSYkBHXyX3JQbpLkSLuGIIap+wMD9LM2EBbPEEQ8=;
	b=LqP0zgnoFj67a2bTdUd+AGyLXwW9ABwH8SKRQ3lLcst/lE4BJkzLzoxLssxr8QA8hiFo
	 AVNE7V7/jog1Z0x3Co9y1BWK5TeXSNLfLzIn5pw0kU1lRAoldFpHh6hIFKL+G8C9uC1rs
	 Imu5HvAcqFFN//dMUGhye9ZXXd3EVbZFw64nXNfAeLZ8qOUxd8IIpLBsCDWl3o6jun52R
	 EBpr09DtMnNLC5oZfrxw0VMX4MJ0/HX59PzmhJPsbfSC9zLDw+msKKPGCAHWFHv78R1Td
	 HH1iwLc3E7VCX1Wmgykl2bD1BCr4r4IBLUzRyDkgaHhqwBIIETfxmG1Rcrtebu5iL7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=JC7TiMLy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC6C606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=JC7TiMLy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288851F000D0;
	Tue, 24 Nov 2026 22:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1795561101;
	bh=oYWZSYkBHXyX3JQbpLkSLuGIIap+wMD9LM2EBbPEEQ8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=JC7TiMLyLdhABGhip8SBbH5X1bjpQxNE6ODCOl5hd4MbNEo23UJ/gulwdmZn0Y+QU
	 za+bkB518xBWCORhapa9kiCNuokLQCYRsB4ZuJjFflSSDONr0HHUx1bXXb5MaC8hZw
	 UiSBpmK7KxQVk5IYD3OzJLDBjjjmjF+JGXVswML8=
Date: Tue, 24 Nov 2026 14:58:20 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: mcroce@microsoft.com, pmladek@suse.com, brads@mainlining.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] reboot: validate reboot CPU against the possible
 mask
Message-Id: <20261124145820.6701d413360b75a5828d13ce@linux-foundation.org>
In-Reply-To: <20261124082914.564587-1-thnkslprpt@gmail.com>
References: <20261124082914.564587-1-thnkslprpt@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 24 Nov 2026 10:29:14 +0200 Avi Weiss <thnkslprpt@gmail.com> wrote:

> 
> reboot_setup() and cpu_store() compare CPU IDs with
> num_possible_cpus(), which is a count rather than an upper bound.
> With a sparse possible mask, this rejects valid CPUs and accepts
> impossible IDs. reboot_setup() also narrows the parsed CPU number
> to int before checking it, allowing large values to be truncated.
> 
> Validate against nr_cpu_ids and cpu_possible() in both interfaces.
> Use simple_strtoull() and unsigned long long for the boot option,
> so the value is not narrowed before validation on 32- or 64-bit
> kernels. Preserve the comma-separated reboot= syntax.

So we're supporting num_possible_cpus>4G?  That's future-safety!

> diff --git a/kernel/reboot.c b/kernel/reboot.c
> index 9a84401adde5..f57b9aaef3f0 100644
> --- a/kernel/reboot.c
> +++ b/kernel/reboot.c
> @@ -1144,12 +1144,11 @@ static int __init reboot_setup(char *str)

but it's __init so who cares.

>  			str += str[1] == 'm' && str[2] == 'p' ? 3 : 1;
>  
>  			if (isdigit(str[0])) {
> -				int cpu = simple_strtoul(str, NULL, 0);
> +				unsigned long long cpu = simple_strtoull(str, NULL, 0);
>  
> -				if (cpu >= num_possible_cpus()) {
> -					pr_err("Ignoring the CPU number in reboot= option. "
> -					"CPU %d exceeds possible cpu number %d\n",
> -					cpu, num_possible_cpus());
> +				if (cpu >= nr_cpu_ids || !cpu_possible(cpu)) {
> +					pr_err("Ignoring invalid CPU %llu in reboot= option\n",
> +					       cpu);
>  					break;
>  				}
>  				reboot_cpu = cpu;
> @@ -1351,7 +1350,7 @@ static ssize_t cpu_store(struct kobject *kobj, struct kobj_attribute *attr,
>  	if (rc)
>  		return rc;
>  
> -	if (cpunum >= num_possible_cpus())
> +	if (cpunum >= nr_cpu_ids || !cpu_possible(cpunum))
>  		return -ERANGE;

lgtm, thanks.
