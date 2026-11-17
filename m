Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952323;
	b=QDlz9yukhucOy2wRQmSdKnv/1vbaVmgETEPDyKWxNmf3q9sZpDKxdtaAt+U1PzfPbBkv
	 ZLhOZT6lOBY+Brxdd4p4pT+iAr8SMv0NqaL0XCdh+yr650vM4jGntcx6BrVpjXOd8TsQL
	 ptUHzNawh1DBht1+oNRs/Kps4iGnQiVR/kUrbQ6A0s8TtnbG1rvHwPU0Zn5vl4L/4//9U
	 mf/5VuHdUBfTqTnmpAvJJ0nbJgr0zg/dooJFV7wUN0CkSG7E0cHUL0asNyukSW01XZLRH
	 nx+zkMXkMPpY1jF2kCNFNsRfrRahTc/sQzWkrsSS9u6LT2K3oBejiBf2rGNLTPML6sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1qwGms5hMR2ux4q7/I/Tiy8y6p3Q9O52I2CVtKqKrq4=;
	b=l+bWBCCi6JZDzKcteCc0QnRNnzfWD5S2fhC5CDsMV44/8CfQ/zGH0++Y38BmNcKVZiTb
	 Yyf4ZNSjLE+h/kCjXU6lHU260plH6V6nSbZ68MLSMXwab0DYlCyfWhLTQxfzyx2cqLj30
	 BdPlnZIZXTxBY1ARlOP6xTN7Ws4wKII0dAaplQUkH+xbmja7h01O9N8X1G5H8mL6N/pCG
	 AkUH9UVl6u3mJ2hSgVS9XTjqIyCGNDS+Zz6FwLm9xKBEkp4+GRXMSa3e8FRDXK1Vp1fQj
	 DL2pCWVZE6ROJFhFlPQJYK1U4xCGO8I9zckMLFfPrYW5IZAZJdQ7Bsy6mJy7f9Uo80A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=udPMbES0;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6CF606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B6CF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=udPMbES0
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-381f65e4e4bso624241eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952322; x=1795557122; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1qwGms5hMR2ux4q7/I/Tiy8y6p3Q9O52I2CVtKqKrq4=;
        b=udPMbES0S0UI5JNlspXvnRXGLvL+W2zq0yiU1w96P37k5Clj8PLIHs74era0RAU0Ck
         hxRFnHVeaE1+K46NXpoMDEBiOQN/jbrobcU5NvTyPHLWcBaeZ9WOZBsY3pWYImVnK1l/
         Tz5SAWxpqn/9xRjvU+94p5aXsYnx1riQgoEdSjoPMC7+epTrL4hPPk7UGIoGiyMVNFdb
         qo5xaFet9hI6c8jd4rUhZpd6duPUY/0wB8iRajlAOC62OMBievQT89txsk3+q/fUv9+c
         8/1IDUj/+gx+Q5KvRQ+7UwJVQHznrEP1SfY8LzaZLCQWEf3256bjNMGf1Se7W/eHIxMu
         NAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952322; x=1795557122;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1qwGms5hMR2ux4q7/I/Tiy8y6p3Q9O52I2CVtKqKrq4=;
        b=YLPB/mLJNGpCFUXuXMq+tGpW1blyHkWiskpF2KXtDgSRLrE9hmR8kxycOT7slKaN3f
         +Ab8XTDZEAxtmmVjNHIM2IGZ9HMLM3yyHs3IndRM7Iq97fFX3AoGV/AmhtwMrmKFmmoA
         HQ1MGVm1gpMrXWE7ey/uZ4aC75ehd+NOBSr1b6jqa7TT1P/8+ZRzGy5blfPu0jy8np5W
         rUeyy5X6sCY/rOd/OnaoQyA+HXgLcJGCsDQfmW7agtAtyRcvPIMkOoX3GzYsaMQyydRP
         +kPtNNHfBHXVTI8B0d03Y4H9TqNSgSl3zu22nSdQBpVks99JtOjoUm8q72krtC4JvMD7
         oiwA==
X-Forwarded-Encrypted: i=1; AL+hErEVX/BATXYtUr38rJuNuXWVS2dSPvi/j/WEjCaO+/tY8PgO9gFci228xuqppx+z5QTV2d1QQ4z3eXFJd6Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Yd6xVTXg7AJ2fGm8geq9gZwyPSvV1SsOt03LIofUQvjgr+vVx
	/6MG2mULWQQ4XIq0hvxi6CfeGC7N6V/KysY4xQSzYqlU3d//dS+ctJTi
X-Gm-Gg: AZFdTZdpGqA9r0wFlFInWDXLghUgjBcdeMx+ud5Ydm+AYIYUtUdIZovKHBNjfL8aVWO
	IMra7/678VZgHCRvc6VYN69FJ59++mhOeBfgfJh2+Yvs2GcUOYeOsQE8nVaKTwBwTMeh/F7l/iV
	e/3fQELKikr4VglSMMEFVK68fDq8SnIY5n8iwWp9YdNOb1uDJ+Fv87epXMqXGScBIIqX3xg2qMV
	nkkWDVKpUCaDeDuV4ACiLscJo9whvGmRQ8BIddewMZTc3n+0JUmeNyjcXjvdbfW25Pntiy6VXOJ
	1s85mzW3jUY545cVnleTNW5XAXXK6MuqzcENA6LariM5P9M1RFzK3dVePpoMARB8MWSuVmhQYYx
	X9fq0OgV4jiyNTTu9xCuOxCvfQLhs1xe/2dYhabNupopFGbEy9zIvimwHthHaP9xRat8SBUCWCe
	Tp40+eDqJAp68NGxU3Q3EvyimAhlimP3C8OHnIHZLBVzm8+XG1xax1Spu+JVLaWqnQPos4tpFtV
	3Hjy9p/U03tes0WW/+uTzN/tU6H1bDfJM9f2lc2cZbzigLiyZ8DYe5MHUZi9SHYiEYz8JD37izm
	CCEI5c/dUx9hZ1Gu8uiAQ9PoQ6HwSGfrR2wUb7ShpJFXFcHSHaRhtHdC4DRK6sVn27o=
X-Received: by 2002:a05:7301:da17:b0:378:314:402c with SMTP id 5a478bee46e88-382814260bamr585440eec.28.1794952322062;
        Tue, 17 Nov 2026 13:52:02 -0800 (PST)
Received: from ?IPV6:2620:10d:c085:21d6::11c9? ([2620:10d:c090:400::5:bd16])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a4522829sm852730eec.1.2026.11.17.13.52.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 13:52:01 -0800 (PST)
Message-ID: <09ae2064-38ff-4d25-83e5-0ac4c3eb1658@gmail.com>
Date: Tue, 17 Nov 2026 13:52:00 -0800
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
Subject: Re: [PATCH net-next] net: mlx5: Allow police as the last action of a
 TC rule
To: Mark Bloch <mbloch@nvidia.com>, netdev@vger.kernel.org
Cc: saeedm@nvidia.com, leon@kernel.org, tariqt@nvidia.com,
 cjubran@nvidia.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, idosch@nvidia.com
References: <20261117031337.4126403-1-mohsin.bashr@gmail.com>
 <82d9959a-8176-4433-94a4-ff72445306ca@nvidia.com>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <82d9959a-8176-4433-94a4-ff72445306ca@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/17/26 11:18 AM, Mark Bloch wrote:
> On 17/11/2026 5:13, Mohsin Bashir wrote:
>> From: Mohsin Bashir <hmohsin@meta.com>
>>
>> In switchdev mode, mlx5 offloads police only when other actions follow
>> it. TC needs no extra action for a police-only rule to work. The mlx5
>> driver makes every police rule forward to the post meter table, but for
>> a rate police it adds that forward only after verify_attr_actions() has
>> checked the rule, so the check rejects it. The ok result of police is
>> also handled as pipe. In TC, ok accepts the packet and ends the action
>> list, whereas mlx5 goes on with the actions after police.
>>
>> Support police as the only action of a rule. Set the forward while
>> parsing police, as is already done for police with mtu, and forward
>> an ok result to the end of the TC chains, as the driver does when it
>> offloads the gact ok action. The upcoming selftest series also relies on
>> such rules for TC offload validation.
>>
>> The patch was tested on a ConnectX-7 in switchdev mode with the command
>> below, and it was verified that the rule is offloaded and limits the
>> matching traffic to the configured rate, using the hardware drop counter.
>>
>>    tc filter add dev eth0 ingress pref 100 protocol ipv6 flower skip_sw \
>>      ip_proto udp dst_port 5201 \
>>      action police rate 100mbit burst 1m conform-exceed drop/ok
>>
>> Cc: Carolina Jubran <cjubran@nvidia.com>
>> Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
>> ---
>>   drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c | 3 ++-
>>   drivers/net/ethernet/mellanox/mlx5/core/en_tc.c            | 3 +++
>>   2 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c
>> index 1bd1c94fb977..52295f5d644c 100644
>> --- a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c
>> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c
>> @@ -94,13 +94,14 @@ tc_act_parse_police(struct mlx5e_tc_act_parse_state *parse_state,
>>   		      MLX5_FLOW_STEERING_CAP_MATCH_RANGES))
>>   			return -EOPNOTSUPP;
>>   
>> -		attr->action |= MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
>>   		attr->flags |= MLX5_ATTR_FLAG_MTU;
>>   	} else {
>>   		attr->action |= MLX5_FLOW_CONTEXT_ACTION_EXECUTE_ASO;
>>   		attr->exe_aso_type = MLX5_EXE_ASO_FLOW_METER;
>>   	}
>>   
>> +	attr->action |= MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
> 
> This makes every police that is the lact action pass verify_attr_actions()
> not only ok case described.
> 
> what happens with:
> "police ... conform-exceed drop/pipe"
> with this not writes to FTEID_TO_REG so what happens once a packet
> reaches the port action table?
> 
> also what about:
> tc filter add dev eth0 ingress pref 100 protocol ipv6 flower skip_sw \
>      ip_proto udp dst_port 5201 \
>      action police rate 100mbit burst 1m conform-exceed drop/pipe \
>      action police rate 100mbit burst 1m conform-exceed drop/pipe
> 
> won't this create a loop?
> 

Thanks for reviewing Mark.

Ahh! I missed the loop case. I had a patch to handle pipe on the last 
police but I dropped it, since my testing showed the post_act table 
still passed the packets up. Let me respin and send pipe and jump on the 
last police to the end of the TC chains. Would that work in your opinion?

>> +
>>   	return 0;
>>   }
>>   
>> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
>> index 1d35c97aea0b..8685e41487f3 100644
>> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
>> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
>> @@ -3892,6 +3892,9 @@ alloc_branch_attr(struct mlx5e_tc_flow *flow,
>>   		attr->action |= MLX5_FLOW_CONTEXT_ACTION_DROP;
>>   		break;
>>   	case FLOW_ACTION_ACCEPT:
>> +		attr->action |= MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
>> +		attr->flags |= MLX5_ATTR_FLAG_ACCEPT;
>> +		break;
>>   	case FLOW_ACTION_PIPE:
>>   		err = set_branch_dest_ft(flow->priv, attr);
>>   		if (err)
> 
> This also changes rules where police is not the last action.
> The conform result defaults to ok when it is not given.
> 
> action police rate 100mbit burst 1m conform-exceed drop \
>          action mirred egress redirect dev eth2
> 
> 
> won't with this change the conforming packets go to the tc end table
> and not to the redirect dev?
> The rule is still reported as offloaded and installs the redirect
> which can't reached now.
> 

Maybe I am missing something here, but when the conform action is not 
given, doesn't it default to ok? For example, if we have
   action police rate 100mbit burst 1m conform-exceed drop action drop
shouldn't conforming packets still be pushed up rather than dropped by 
the following action, making the action drop (or the action mirred) dead 
code?

> Mark
> 

