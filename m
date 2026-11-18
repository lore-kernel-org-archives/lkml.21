Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018417;
	b=LKfRog6RWG64l5q6uaGHX4rX9iDSbhpEHQxfFuQIoWTIF0ThXSOdS7zyTBi5t5nqE3Nx
	 BeuCzCSoOyCpuKfl/pfwIuTp+99peWyAQ1e7MydGp10BUacimhk3nZ4LCwX6k0PwtDu45
	 e34qP169w1cqnvYXHo8UJTaYqIOcs8REGYN5/IiOMiEpjh6ZzHvQEGWehZUDygAkYpw1A
	 O6nRV7I1uI8Lvn0/1VS8tCGXuO9VpoLGjX+pPaFwg23eWXjcUs49oVpSBgulAD519y7MK
	 FI4mmTneoWnz2TltsIAHDDrPZ4mOmrnLuuRXJHDXXmsBQje8z0NkHuNNHzwFuqzk2UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0FM4FQIqQtreZz9AMQxrrTMs14QrvVaeC8B90V412GA=;
	b=YBXdU2jvANrVhoigvrXG4hV+jlGsDWWc0hhNZjg3nrc7i5SYJq1fiFBF9vQTw5kVUZMA
	 DS/TFHIUwT6cJ60AUoHbhQxXwlUkAmdYBzAQId92McWxtEo64PDp758PvixedB1TE0p6O
	 Xq0TTvera4QeEjGAx9657B34WIlE2vPefOeS8Uftl2uJDuhQOxs5psk0zlmENF/3C1SZs
	 SYtUCSEw8wdPDuOWLTNFVLh1V+RyNgynnwqkh2hsUHpCcNQkpbKpVxEF4QVbcRhvWsciS
	 nd7iqbsLGahWBHkkL4xRL+ZN2OM49RAO0+QBU5jGK/rvIok2+O14tDZrfTjpOByE3LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=aJFjctBm;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22438606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22438606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=aJFjctBm
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-833e671ee9fso1077233a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795018415; x=1795623215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0FM4FQIqQtreZz9AMQxrrTMs14QrvVaeC8B90V412GA=;
        b=aJFjctBmNOdAbnnUsAixe5ZWeGLsRzqrg5gmvs857dlS7eolt5uI2uCMueOecgSXFc
         UYcuK5utz3v+GnQKgRjfats8gyuVklykTU1i7OkVQ9Z6y2/uh9X2ZqrbsTmNTyWl9Boh
         i8xqr/C3fJfjRjtOdfzp1XloKPoRcSiKV7fLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018415; x=1795623215;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0FM4FQIqQtreZz9AMQxrrTMs14QrvVaeC8B90V412GA=;
        b=FIsnQIzqx+Sayz94SvNoJ61FVqMKLVlOrvEoI0Cqe0aH4DoJ2EN70sksNIg4cLg4kP
         akZqXjnJCHnUJFC7IaKwJB42bS0UJhNHtwAxxJ2VqYdywxP5PZvE1snllF01yQSdt1cL
         uD/A4u51pJ6kTcfqY+ljy4qp/eAZUaAJDu818l1xXKORh5zZJEw+w/TXSgu1ySNVOTJ7
         AfGngJJKmZpwm3rdq+dlW17e7p9A7UeCykKFDir6aptgx//0WzcD+vx0BlCNiAHJHLtk
         kzc9/Pv/0uRM1MxDQIT/jzyk4fQM/V1evtZdoxPb0PA0yzoY8etCpB2N+xIpbrS/uR/x
         ibBA==
X-Forwarded-Encrypted: i=1; AL+hErE7bjAytcsjWmphxo7c/6d82ccnaT8K1gyvZsr0w8W0X6OSK1kO4R4CXQeNlr12izY0eIyjTuKKIVpeRgI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8f38RYkU1jglvrgHiG3j3f4GsPmwZTkg1MSuAJQcRWWinh39ub
	sqvmah3bb5AIumOBFyDxLBoqaB5ArrcoPj8YlS9oKQSLlpxqSjPzMnvni+V9hslpXNU=
X-Gm-Gg: AYBFou1VQOch26Dh54UCL4EjqqSEBzYct13dvdl4ExpAT0bmWfai4znoPJLhcY8n5BJ
	BOrT/un9laIi4vwr0KkB3rwq7Nqz7uab0YexiP1N0gPEn4eiSDl6IdtnqWC3ZeQtuoRBnzmdWnf
	6yx8opAtc6f3u6xyqcNTsqEPcG/YPEhlGnLUPD1MScNj5ffCLeoNlJEHxTTOrJozCHPajX8zZMe
	bSNQlMUYlTxkEDGZt3kzZYuxPL+Rbk/t3F/xqYUfklMbwUBz+v0jC7ZxSr72zrR6/CW8M2dEIVa
	YZOhDdoLn4cGnNJq+puSXG29tU0zySIa4jO4Q7fCqTs7KLewoEtX6bXhWbEOpMTy64bd1HOrtNX
	df4JMeamo9StNuFHyOvP0tkbf1PtexNcY9eQ1FjnTaVEaQbzRy5nBoWt6n3wOdmFZqGl2TuLsZr
	b18bitr6OYlXkZwJu81tw+lrxxYC/vnIq6nENy/A436mrrl2oENYJe/2v1qGjWNyg97l64rF+LA
	QyVF0OeNOyFUu61qqWQPW0nFrvcgL5Oyxo/yPyq01U+Pw7f/7ZZ+pdSsADl7/P5TwAb+smwkFly
	lu/W/KwUoh6mmQ9i+fsLiq0OqQflZJByX/XiCQSn
X-Received: by 2002:a05:6830:4420:b0:862:a48e:24e2 with SMTP id 46e09a7af769-862f0954f8bmr3199401a34.16.1795018415078;
        Wed, 18 Nov 2026 08:13:35 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f00891e6sm2271527a34.0.2026.11.18.08.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:13:34 -0800 (PST)
Message-ID: <8a436334-d306-4a34-bb7b-efc713aed0f8@linuxfoundation.org>
Date: Wed, 18 Nov 2026 09:13:30 -0700
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
Subject: Re: [PATCH 1/3] selftests: use local variables consistently in
 runner.sh
To: "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>, Shuah Khan
 <shuah@kernel.org>, David Ahern <dsahern@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Hangbin Liu
 <hangbin.liu@linux.dev>, =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?=
 <ricardo@marliere.net>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261118-kselftest-run-timer-v1-0-53a838b2d62b@xs4all.nl>
 <20261118-kselftest-run-timer-v1-1-53a838b2d62b@xs4all.nl>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261118-kselftest-run-timer-v1-1-53a838b2d62b@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 06:40, Jori Koolstra (CIQ) wrote:
> run_one() and run_many() assign their working variables without
> declaring them local, so they leak into the global namespace of
> whichever shell sources runner.sh, i.e. run_kselftest.sh or the
> RUN_TESTS recipe in lib.mk.
> 

Hmm. so if a timeout value of say 60 seconds comes from a test
settings file, does it persist? Can you see that if you run a
few tests using TARGETS variable?

> Declare these variables local so that local is used consistently
> throughout the file and the sourcing shell's namespace is not polluted.
> This does not add a new requirement on the shell: local is already used
> in run_many(), in_netns() and run_in_netns().

Makes sense.

> 
> Also, obey the convention to use upper case names for variables that are
> constant once assigned.

Can you elaborate on this convention?

I don't want to see these changes combined. We don't combine
cleanup and convention changes with real changes.

> 
> Signed-off-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
> ---
>   tools/testing/selftests/kselftest/runner.sh | 29 ++++++++++++++++++-----------
>   1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
> index 45fb8ec38493..9b1dad5441ea 100644
> --- a/tools/testing/selftests/kselftest/runner.sh
> +++ b/tools/testing/selftests/kselftest/runner.sh
> @@ -58,13 +58,18 @@ tap_timeout()
>   
>   run_one()
>   {
> +	local DIR TEST BASENAME_TEST BASENAME_SANITIZED SETTINGS TEST_HDR_MSG
> +	local line field value interpreter stdbuf cmd rc
> +
>   	DIR="$1"
>   	TEST="$2"
>   
>   	BASENAME_TEST=$(basename $TEST)
>   
>   	# Reset any "settings"-file variables.
> -	export kselftest_timeout="$kselftest_default_timeout"
> +	local kselftest_timeout="$kselftest_default_timeout"
> +	# Make kselftest_timeout variables available to tests
> +	export kselftest_timeout
>   
>   	# Safe default if tr not available
>   	kselftest_cmd_args_ref="KSELFTEST_ARGS"
> @@ -91,8 +96,8 @@ run_one()
>   	fi
>   
>   	# Load per-test-directory kselftest "settings" file.
> -	settings="$BASE_DIR/$DIR/settings"
> -	if [ -r "$settings" ] ; then
> +	SETTINGS="$BASE_DIR/$DIR/settings"
> +	if [ -r "$SETTINGS" ] ; then
>   		while read line ; do
>   			# Skip comments.
>   			if echo "$line" | grep -q '^#'; then
> @@ -100,8 +105,8 @@ run_one()
>   			fi
>   			field=$(echo "$line" | cut -d= -f1)
>   			value=$(echo "$line" | cut -d= -f2-)
> -			eval "kselftest_$field"="$value"
> -		done < "$settings"
> +			eval "local kselftest_$field"="$value"
> +		done < "$SETTINGS"
>   	fi
>   
>   	# Command line timeout overrides the settings file
> @@ -164,8 +169,8 @@ run_one()
>   
>   in_netns()
>   {
> -	local name=$1
> -	ip netns exec $name bash <<-EOF
> +	local NAME=$1
> +	ip netns exec $NAME bash <<-EOF
>   		BASE_DIR=$BASE_DIR
>   		source $BASE_DIR/kselftest/runner.sh
>   		logfile=$logfile
> @@ -175,9 +180,9 @@ in_netns()
>   
>   run_in_netns()
>   {
> -	local tmplog="/tmp/$(mktemp -u ${BASENAME_TEST}-XXXXXX)"
> -	local netns=$(mktemp -u ${BASENAME_TEST}-XXXXXX)
> -	local rc
> +	local tmplog netns rc
> +	tmplog="/tmp/$(mktemp -u ${BASENAME_TEST}-XXXXXX)"
> +	netns=$(mktemp -u ${BASENAME_TEST}-XXXXXX)
>   
>   	ip netns add $netns
>   	if [ $? -ne 0 ]; then
> @@ -198,8 +203,10 @@ run_in_netns()
>   
>   run_many()
>   {
> +	local DIR TEST BASENAME_TEST
> +	local pids pid rc
> +
>   	DIR="${PWD#${BASE_DIR}/}"
> -	local rc
>   	pids=
>   
>   	for TEST in "$@"; do
> 

thanks,
-- Shuah
